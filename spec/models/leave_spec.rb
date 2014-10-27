require 'rails_helper'

RSpec.describe Leave, :type => :model do
 it "should be valid" do
    leave = Leave.new(
      user_id: 1,
      arsyetimi: 'Pushim vjetor')
      
      expect(leave).to be_valid
 end
 
 it "should not be valid withoud user_id" do
   leave = Leave.new(
     user_id: nil,
     arsyetimi: 'Pushim vjetor')
   expect(leave).not_to be_valid
 end
 
 it "shows from newest to oldest" do
   leave = Leave.
 end
 
end
