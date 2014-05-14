require 'test_helper'

class Admin::EntriesControllerTest < ActionController::TestCase
  setup do
    @entry = admin_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_entry" do
    assert_difference('Admin::Entry.count') do
      post :create, admin_entry: { category_id: @entry.category_id, description: @entry.description, title: @entry.title, url: @entry.url }
    end

    assert_redirected_to admin_entry_path(assigns(:admin_entry))
  end

  test "should show admin_entry" do
    get :show, id: @entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry
    assert_response :success
  end

  test "should update admin_entry" do
    patch :update, id: @entry, admin_entry: { category_id: @entry.category_id, description: @entry.description, title: @entry.title, url: @entry.url }
    assert_redirected_to admin_entry_path(assigns(:admin_entry))
  end

  test "should destroy admin_entry" do
    assert_difference('Admin::Entry.count', -1) do
      delete :destroy, id: @entry
    end

    assert_redirected_to admin_entries_path
  end
end
