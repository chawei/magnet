require 'test_helper'

class LangMappingsControllerTest < ActionController::TestCase
  setup do
    @lang_mapping = lang_mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lang_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lang_mapping" do
    assert_difference('LangMapping.count') do
      post :create, :lang_mapping => @lang_mapping.attributes
    end

    assert_redirected_to lang_mapping_path(assigns(:lang_mapping))
  end

  test "should show lang_mapping" do
    get :show, :id => @lang_mapping.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lang_mapping.to_param
    assert_response :success
  end

  test "should update lang_mapping" do
    put :update, :id => @lang_mapping.to_param, :lang_mapping => @lang_mapping.attributes
    assert_redirected_to lang_mapping_path(assigns(:lang_mapping))
  end

  test "should destroy lang_mapping" do
    assert_difference('LangMapping.count', -1) do
      delete :destroy, :id => @lang_mapping.to_param
    end

    assert_redirected_to lang_mappings_path
  end
end
