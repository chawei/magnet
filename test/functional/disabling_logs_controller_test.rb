require 'test_helper'

class DisablingLogsControllerTest < ActionController::TestCase
  setup do
    @disabling_log = disabling_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disabling_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disabling_log" do
    assert_difference('DisablingLog.count') do
      post :create, :disabling_log => @disabling_log.attributes
    end

    assert_redirected_to disabling_log_path(assigns(:disabling_log))
  end

  test "should show disabling_log" do
    get :show, :id => @disabling_log.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @disabling_log.to_param
    assert_response :success
  end

  test "should update disabling_log" do
    put :update, :id => @disabling_log.to_param, :disabling_log => @disabling_log.attributes
    assert_redirected_to disabling_log_path(assigns(:disabling_log))
  end

  test "should destroy disabling_log" do
    assert_difference('DisablingLog.count', -1) do
      delete :destroy, :id => @disabling_log.to_param
    end

    assert_redirected_to disabling_logs_path
  end
end
