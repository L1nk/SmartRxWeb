require 'test_helper'

class ScheduleToAlertsControllerTest < ActionController::TestCase
  setup do
    @schedule_to_alert = schedule_to_alerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_to_alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_to_alert" do
    assert_difference('ScheduleToAlert.count') do
      post :create, schedule_to_alert: @schedule_to_alert.attributes
    end

    assert_redirected_to schedule_to_alert_path(assigns(:schedule_to_alert))
  end

  test "should show schedule_to_alert" do
    get :show, id: @schedule_to_alert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_to_alert
    assert_response :success
  end

  test "should update schedule_to_alert" do
    put :update, id: @schedule_to_alert, schedule_to_alert: @schedule_to_alert.attributes
    assert_redirected_to schedule_to_alert_path(assigns(:schedule_to_alert))
  end

  test "should destroy schedule_to_alert" do
    assert_difference('ScheduleToAlert.count', -1) do
      delete :destroy, id: @schedule_to_alert
    end

    assert_redirected_to schedule_to_alerts_path
  end
end
