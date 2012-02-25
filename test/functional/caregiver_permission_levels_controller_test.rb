require 'test_helper'

class CaregiverPermissionLevelsControllerTest < ActionController::TestCase
  setup do
    @caregiver_permission_level = caregiver_permission_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caregiver_permission_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caregiver_permission_level" do
    assert_difference('CaregiverPermissionLevel.count') do
      post :create, caregiver_permission_level: @caregiver_permission_level.attributes
    end

    assert_redirected_to caregiver_permission_level_path(assigns(:caregiver_permission_level))
  end

  test "should show caregiver_permission_level" do
    get :show, id: @caregiver_permission_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caregiver_permission_level
    assert_response :success
  end

  test "should update caregiver_permission_level" do
    put :update, id: @caregiver_permission_level, caregiver_permission_level: @caregiver_permission_level.attributes
    assert_redirected_to caregiver_permission_level_path(assigns(:caregiver_permission_level))
  end

  test "should destroy caregiver_permission_level" do
    assert_difference('CaregiverPermissionLevel.count', -1) do
      delete :destroy, id: @caregiver_permission_level
    end

    assert_redirected_to caregiver_permission_levels_path
  end
end
