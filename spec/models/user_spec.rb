require "spec_helper"

describe "User" do
  before :all do
    User.delete_all
  end

  # being lazy here.... could use a generic user factory but decided to keep it simple.

  it "validates password confirmation" do
    expect { User.create!(username: "bob", password: "123", password_confirmation: "1234") }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "creates a user" do
    User.create!(username: "billy", password: "123", password_confirmation: "123", first_name: "d", last_name: "dd").should be_true
  end

  it "validate uniqueness of username" do
    expect { User.create!(username: "billy", password: "123", password_confirmation: "123", first_name: "d", last_name: "dd") }.to raise_error(ActiveRecord::RecordInvalid)
  end

end