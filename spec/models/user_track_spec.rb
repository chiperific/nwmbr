require 'rails_helper'

RSpec.describe UserTrack, type: :model do
  it "is valid with valid attributes"
  it "is not valid without timestamps"
  it "is not valid without a user"
  it "is not valid without a role_requested"
  it "deletes when the user is deleted"
end
