require 'test_helper'

class JustificatifsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get justificatifs_new_url
    assert_response :success
  end

  test "should get create" do
    get justificatifs_create_url
    assert_response :success
  end

end
