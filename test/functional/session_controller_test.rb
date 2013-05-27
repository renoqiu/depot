require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    user = users(:one)
    post :create, name: user.name, password: 'secret'
    assert_redirected_to admin_path
    assert_equal session[:user_id], user.name
  end

  test "should logout" do
    get :destroy
    assert_redirected_to store_url
  end

end
