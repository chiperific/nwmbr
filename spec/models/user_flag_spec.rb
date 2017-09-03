require 'rails_helper'

RSpec.describe UserFlag, type: :model do
  it "is valid with valid attributes"
  it "is not valid without timestamps"
  it "is not valid without a user"
  it "is not valid without flagged_by"
  it "is not valid without flagged_at"
  it "deletes when the user is deleted"
end
