require 'test_helper'

class SharedImagesControllerTest < ActionController::TestCase
  setup do
    @shared_image = shared_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shared_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shared_image" do
    assert_difference('SharedImage.count') do
      post :create, :shared_image => @shared_image.attributes
    end

    assert_redirected_to shared_image_path(assigns(:shared_image))
  end

  test "should show shared_image" do
    get :show, :id => @shared_image.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shared_image.to_param
    assert_response :success
  end

  test "should update shared_image" do
    put :update, :id => @shared_image.to_param, :shared_image => @shared_image.attributes
    assert_redirected_to shared_image_path(assigns(:shared_image))
  end

  test "should destroy shared_image" do
    assert_difference('SharedImage.count', -1) do
      delete :destroy, :id => @shared_image.to_param
    end

    assert_redirected_to shared_images_path
  end
end
