require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  it "is valid with valid attributes"
  it "is not valid without timestamps"
  it "is not valid without a user"
  it "is not valid without a location"
  it "deletes when a user is deleted"
  it "is archived when marked complete"
end
