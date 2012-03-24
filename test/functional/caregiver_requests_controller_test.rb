require 'test_helper'

class CaregiverRequestsControllerTest < ActionController::TestCase
  setup do
    @caregiver_request = caregiver_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caregiver_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caregiver_request" do
    assert_difference('CaregiverRequest.count') do
      post :create, caregiver_request: @caregiver_request.attributes
    end

    assert_redirected_to caregiver_request_path(assigns(:caregiver_request))
  end

  test "should show caregiver_request" do
    get :show, id: @caregiver_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caregiver_request
    assert_response :success
  end

  test "should update caregiver_request" do
    put :update, id: @caregiver_request, caregiver_request: @caregiver_request.attributes
    assert_redirected_to caregiver_request_path(assigns(:caregiver_request))
  end

  test "should destroy caregiver_request" do
    assert_difference('CaregiverRequest.count', -1) do
      delete :destroy, id: @caregiver_request
    end

    assert_redirected_to caregiver_requests_path
  end
end
