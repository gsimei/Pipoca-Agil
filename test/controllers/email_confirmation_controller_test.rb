require "test_helper"

class EmailConfirmationControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get email_confirmation_confirm_url
    assert_response :success
  end
end
