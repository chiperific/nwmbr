# README

Still to do:
* Refresh my brain about capybara && RSpec
** Controller tests
** View tests (w/ Capybara)
** Helper tests


* Learn about jbuilder
https://github.com/rails/jbuilder

* Create message model for handling user messages? E.g. - "The [Link] you flagged has been resolved."
> Can do all using current_user.last_sign_in_at && [user_flags, link_flags, user_tracks
>> Create current_user.messages def

* Flesh out all basic actions from MVC
** Users, Links, Bookmarks, UserTracks, LinkTracks need self.active defs

* Use CanCan for action auth (change roles from strings to ??)
* Build out the actions (public, guest, contributor, moderator, admin)

* Write tests for various roles

* Refresh my brain about ajax and json calls
** WTF is jbuilder and why does it scaffold views for me?

* Get my pure_ruby working in the Bible model/controller
** Finish features for:
*** searching text
*** navigating to passages of various dimensions (single verse, multiple verses, single chapter, multiple chapters, whole book)
*** switching versions on the fly

* Polish the views
** Handle the Devise error fields loosing their bootstraps
** Ditch the devise bootstrap gem in favor of edited views/devise/*all

* Go to production (sure, Heroku, why not?)
* Learn to send an electronic letter for Devise:
** https://launchschool.com/blog/handling-emails-in-rails
** https://github.com/rails/rails/tree/master/actionmailer
** http://api.rubyonrails.org/v5.1.3/classes/ActionMailer/Base.html
** http://guides.rubyonrails.org/action_mailer_basics.html
