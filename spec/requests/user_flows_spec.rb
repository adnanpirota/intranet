require 'rails_helper'

RSpec.describe "UserFlows", :type => :request do
  it "test login with invalid information" do
    user = User.create!(:emaili "", :password "")
    get "/login"
    
    assert_select "form.login" do
      assert_select "input[emaili=?]", "emaili"
      assert_select "input[password=?]", "password"
      assert_select "input[type=?]", "submit"
    end
    
  end
end
