require "test_helper"

class UsersHelperTest < ActionView::TestCase

  def test_sanity
    #flunk "Need real tests"
    get :new
    assert_response :success
    
  end

end
