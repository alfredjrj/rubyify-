require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  
  test "valid signup information" do
    get root_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { lastname: "parara",
                                            firstname:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'stores/new'
  end
  
end
