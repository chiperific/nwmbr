require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes"
  it "is not valid without timestamps"
  it "is not valid without an email"
  it "is not valid without a password"
  it "is not valid without a role"
  it "is not valid without a username"
  it "is not valid without an archived value"
end
