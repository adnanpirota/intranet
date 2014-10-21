require "test_helper"

class UserTest < ActiveSupport::TestCase

  def user
    @user ||= User.new(emri: "Adnan Pirota", emaili: "adnan.pirota@devollicorporation.com")
  end

  def test_valid
    assert user.valid?
  end
  
  def test_present
    @user.emri = "   "
    assert_not @user.valid?
  end

end
