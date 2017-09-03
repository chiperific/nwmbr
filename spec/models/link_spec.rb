require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is valid with valid attributes"
  it "is not valid without timestamps"
  it "is not valid without a user"
  it "is not valid without a url"
  it "is not valid without a location"
  it "is not valid without a author's name"
  it "is not valid without an archived value"
end
