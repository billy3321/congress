require 'test_helper'

class Admin::LegislatorsControllerTest < ActionController::TestCase
  setup do
    @admin_legislator = admin_legislators(:one)
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
      post :create, admin_legislator: { constituency: @admin_legislator.constituency, description: @admin_legislator.description, name: @admin_legislator.name, party_id: @admin_legislator.party_id }
    end

    assert_redirected_to admin_legislator_path(assigns(:admin_legislator))
  end

  test "should show admin_legislator" do
    get :show, id: @admin_legislator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_legislator
    assert_response :success
  end

  test "should update admin_legislator" do
    patch :update, id: @admin_legislator, admin_legislator: { constituency: @admin_legislator.constituency, description: @admin_legislator.description, name: @admin_legislator.name, party_id: @admin_legislator.party_id }
    assert_redirected_to admin_legislator_path(assigns(:admin_legislator))
  end

  test "should destroy admin_legislator" do
    assert_difference('Admin::Legislator.count', -1) do
      delete :destroy, id: @admin_legislator
    end

    assert_redirected_to admin_legislators_path
  end
end
