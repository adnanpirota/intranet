require 'rails_helper'

RSpec.describe AccountActivationsController, :type => :controller do

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to be_success
    end
  end

end
