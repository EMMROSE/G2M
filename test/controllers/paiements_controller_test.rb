require 'test_helper'

class PaiementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get paiements_index_url
    assert_response :success
  end

  test "should get new" do
    get paiements_new_url
    assert_response :success
  end

  test "should get create" do
    get paiements_create_url
    assert_response :success
  end

  test "should get show" do
    get paiements_show_url
    assert_response :success
  end

  test "should get edit" do
    get paiements_edit_url
    assert_response :success
  end

  test "should get update" do
    get paiements_update_url
    assert_response :success
  end

end
