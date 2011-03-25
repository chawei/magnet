require 'test_helper'

class LikeButtonsControllerTest < ActionController::TestCase
  setup do
    @like_button = like_buttons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:like_buttons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create like_button" do
    assert_difference('LikeButton.count') do
      post :create, :like_button => @like_button.attributes
    end

    assert_redirected_to like_button_path(assigns(:like_button))
  end

  test "should show like_button" do
    get :show, :id => @like_button.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @like_button.to_param
    assert_response :success
  end

  test "should update like_button" do
    put :update, :id => @like_button.to_param, :like_button => @like_button.attributes
    assert_redirected_to like_button_path(assigns(:like_button))
  end

  test "should destroy like_button" do
    assert_difference('LikeButton.count', -1) do
      delete :destroy, :id => @like_button.to_param
    end

    assert_redirected_to like_buttons_path
  end
end
