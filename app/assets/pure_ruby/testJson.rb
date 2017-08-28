require 'multi_json'
require 'pp'
require 'fuzzy_match'
#require 'picky'

bible_versions = ["NIV", "ESV", "MSG", "NLT"]
$selected_version = bible_versions[0]

# make bible_versions selectable
bible_file = File.read('bibles/'+$selected_version+'.json')
$bible_json = MultiJson.load(bible_file)
## Rails: deep_symbolize_keys!
# how much speed is saved by not loading all?

toc_file = File.read('toc.json')
$toc = MultiJson.load(toc_file)

# Also, here's a list of numbers, since strings are hard.
$numary = [*0..200].map { |n| n.to_s }

def bible_array # easier searching
	reference = []
	bible_ary = [$selected_version]
	$toc.keys.each do |book|
		$bible_json[book].each do |k,chapter|
			chapter.each do |verse|
				reference << [book, k.to_i, verse[0].to_i, verse[1]]
			end
		end
	end
	reference.sort_by! { |r| [$toc.keys.index(r[0]), r[1], r[2]] }

	n = 0
	reference.each do |r|
		bible_ary << [n, r]
		n = n+1
	end

	bible_ary #Yeah, that's the entire bible in this format: [Version [index#, [book, chapter#, verse#, verse]]]
end

def bible_hash # faster lookups
	# NEEDS TO: deep symbolize keys, convert string numbers to integers

	# bible_sorted_by_book_ary = $bible_json.sort_by { |k, v| $toc.keys.index(k) }
	# bible_sorted_hsh = {}
	# bible_sorted_by_book_ary.each do |k,v|
	# 	bible_sorted_by_book_hsh[k] = v
	# end

	# bible_sorted_by_book_and_verse_hsh = {}

	# bible_sorted_by_book_hsh.each do |book, chapter|
	# 	bible_sorted_by_book_hsh[book].each do |chapter, verse|
	# 		bible_sorted_by_book_hsh[book][chapter].each do |verse_num, verse|
	# 			bible_sorted_by_book_and_verse_hsh
	# 		end
	# 	end
	# end

	# bible_hsh
end

def search_bible( search_string,
									search_inclusion = "any",
									search_case = "match",
									spelling = "fuzzy",
									stop_words = true,
									stemming = true )

	#I see your string and I raise you and array of strings. I don't care what they look like, I can wash them.
	search_terms = search_string.split(/[,;.]/)

	# A girl wants to know what we do with them after we wash them. A girl is not ready.
	search_terms.map! { |t| t.gsub(/[\u2018\u2019]/, "'").gsub(/^\s|[^a-zA-Z\s\']|\s$/, '') }

	search_terms_temp = search_terms.clone

	if stop_words == true
		stop_word_list = [ "a", "also", "am", "an", "and", "any", "are", "as", "at", "be", "but", "by", "can", "can't", "cannot", "could", "for", "from", "had", "has", "have", "how", "i", "ie", "if", "in", "is", "it", "its", "it's", "itself", "may", "me", "most", "mostly", "much", "must", "my", "not", "of", "on", "or", "so", "than", "that", "that's", "the", "then", "this", "to", "very", "was", "were", "when", "whence", "where", "with", "would", "yet"]
    search_terms_temp.map! { |t| t.downcase }
		delete_indexes = []
		search_terms_temp.each_with_index do |s, i|
			if stop_word_list.any? { |word| word == s }
				delete_indexes << i
			end
		end
		search_terms.delete_if.with_index { | t, i| delete_indexes.include? i }
		search_terms.uniq!
		search_terms_temp = search_terms.clone
	end

	if search_case == "ignore"
		# duplicate search terms with various capitalizations
		search_terms_temp.each do |s|
			search_terms << s.titleize
			search_terms << s.downcase
			search_terms << s.upcase
		end
		search_terms.uniq!
		search_terms_temp = search_terms.clone
	end

	# Also needs:
	## speling [[match][fuzzy]](with regexp ~?) --https://github.com/diasks2/ruby-nlp#text-similarity
	## stemming [true|false] (reducing words to their root form) --https://github.com/diasks2/ruby-nlp#stemmers

	#### Oh, you're SOO OBSOLETE. Bible_printer just wasted you!!!
	#### Yeah, that's an ordered bible in nested arrays. Yeah. I can search on anything!!!!!
	### Hmm, going to have to deal with #s, maybe only search on index[0] and index[-1]?
	#
	# search_result = []
	# $toc.keys.each do |book|
	# 	$bible[book].each do |k,chapter|
	# 		chapter.each do |verse|
	# 			if search_inclusion == "any"
	# 				# if verse[1].include? search_terms #single word only
	# 				if verse[1][Regexp.union(search_terms)]
	# 					search_result << [book, k, verse[0]]
	# 				end
	# 			else #search_type = "all"
	# 				#must match true for all search_terms
	# 				if search_terms.all? { |term| verse[1].include? term }
	# 					search_result << [book, k, verse[0]]
	# 				end
	# 			end
	# 		end
	# 	end
	# end
end

def navigate_bible()
	# Catch patterns indicative of a specific book, chapter, passage (multiple chapers or verses), or verse and return only that.
	# things like "Genesis 1:1-2", "Col 2-4", "1 John 9".
	#
	# Then, if it looks like a word search, pass it to search_bible
	#
	# Otherwise, look up the verse by matching against index[0],[1],[2]
	#
	# Could be separate auto-complete fields [book] [chapter (handles 1-2; 1,4; 1-3,7,9)] [verse (handles 1-2; 1,4; 1-3,7,9)]
end

#search_bible("God, Jesus, Holy Spirit, desert, caanan", "any")
p bible_array
#p bible_hash
