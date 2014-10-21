require 'rails_helper'
require 'user'

RSpec.describe User do
  
  let(:user) { User.new(emri:"Adnan Pirota", emaili:"adnanpirota2011@gmail.com", password: "foobar", password_confirmation: "foobar")}
  
  
  #it "is named Adnan" do
   # user = User.new
    #expect(user.emri).to eq('Adnan Pirota')
  #end
  
  #it "has reparti" do
   # user = User.new
    #expect(user.reparti).to be > 0
  
  #end
  
  #it "is ne pushim" do
   # user = User.new
    #expect(user.ne_pushim?).to be false
  #end
  
  it "is valid" do
    expect(user).to be_valid  
  end
  
  it "must have a name" do
    user.emri = ""
    expect(user).not_to be_valid
  end
  
  it "must have an email" do
    user.emaili = ""
    expect(user).not_to be_valid
  end
  
  it "should not have too long name" do
    user.emri = "a" * 51
    expect(user).not_to be_valid
  end
  
  it "should not have to long email" do
    user.emaili = "a" * 256
    expect(user).not_to be_valid
  end
  
  it "passowrd must have at lease 6 characters" do
    user.password = user.password_confirmation = "a" * 5
    expect(user).not_to be_valid
  end
  
  
  
  
  
  #it "is invalid without a name" do
  #  user = User.new
  #  expect(user).not_to be_valid 
  #end
  
 

end


