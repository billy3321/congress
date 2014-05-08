require 'test_helper'

class Admin::VideosControllerTest < ActionController::TestCase
  setup do
    @admin_video = admin_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_video" do
    assert_difference('Admin::Video.count') do
      post :create, admin_video: { description: @admin_video.description, title: @admin_video.title, url: @admin_video.url }
    end

    assert_redirected_to admin_video_path(assigns(:admin_video))
  end

  test "should show admin_video" do
    get :show, id: @admin_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_video
    assert_response :success
  end

  test "should update admin_video" do
    patch :update, id: @admin_video, admin_video: { description: @admin_video.description, title: @admin_video.title, url: @admin_video.url }
    assert_redirected_to admin_video_path(assigns(:admin_video))
  end

  test "should destroy admin_video" do
    assert_difference('Admin::Video.count', -1) do
      delete :destroy, id: @admin_video
    end

    assert_redirected_to admin_videos_path
  end
end
