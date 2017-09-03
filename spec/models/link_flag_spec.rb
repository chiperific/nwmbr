require 'rails_helper'

RSpec.describe LinkFlag, type: :model do
  it "is valid with valid attributes"
  it "is not valid without timestamps"
  it "is not valid without a user"
  it "is not valid without a link"
  it "is not valid without a comment"
  it "is not valid without a flagged_by user"
  it "is not valid without a flagged_at date"
end
