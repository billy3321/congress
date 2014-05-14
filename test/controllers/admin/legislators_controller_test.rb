require 'test_helper'

class Admin::LegislatorsControllerTest < ActionController::TestCase
  setup do
    @legislator = admin_legislators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_legislators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_legislator" do
    assert_difference('Admin::Legislator.count') do
      post :create, admin_legislator: { constituency: @legislator.constituency, description: @legislator.description, name: @legislator.name, party_id: @legislator.party_id }
    end

    assert_redirected_to admin_legislator_path(assigns(:admin_legislator))
  end

  test "should show admin_legislator" do
    get :show, id: @legislator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @legislator
    assert_response :success
  end

  test "should update admin_legislator" do
    patch :update, id: @legislator, admin_legislator: { constituency: @legislator.constituency, description: @legislator.description, name: @legislator.name, party_id: @legislator.party_id }
    assert_redirected_to admin_legislator_path(assigns(:admin_legislator))
  end

  test "should destroy admin_legislator" do
    assert_difference('Admin::Legislator.count', -1) do
      delete :destroy, id: @legislator
    end

    assert_redirected_to admin_legislators_path
  end
end
