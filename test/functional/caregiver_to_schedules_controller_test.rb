require 'test_helper'

class CaregiverToSchedulesControllerTest < ActionController::TestCase
  setup do
    @caregiver_to_schedule = caregiver_to_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caregiver_to_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caregiver_to_schedule" do
    assert_difference('CaregiverToSchedule.count') do
      post :create, caregiver_to_schedule: @caregiver_to_schedule.attributes
    end

    assert_redirected_to caregiver_to_schedule_path(assigns(:caregiver_to_schedule))
  end

  test "should show caregiver_to_schedule" do
    get :show, id: @caregiver_to_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caregiver_to_schedule
    assert_response :success
  end

  test "should update caregiver_to_schedule" do
    put :update, id: @caregiver_to_schedule, caregiver_to_schedule: @caregiver_to_schedule.attributes
    assert_redirected_to caregiver_to_schedule_path(assigns(:caregiver_to_schedule))
  end

  test "should destroy caregiver_to_schedule" do
    assert_difference('CaregiverToSchedule.count', -1) do
      delete :destroy, id: @caregiver_to_schedule
    end

    assert_redirected_to caregiver_to_schedules_path
  end
end
