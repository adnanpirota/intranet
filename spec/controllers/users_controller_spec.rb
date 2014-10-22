require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  
  it "responds successfully with HTTP 200 status code" do
    get :new 
    expect(response).to be_sucess
    expect(response).to have_http_status(200)
    
  end
end
