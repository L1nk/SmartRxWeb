require 'test_helper'

class ScheduleAlertsControllerTest < ActionController::TestCase
  setup do
    @schedule_alert = schedule_alerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_alert" do
    assert_difference('ScheduleAlert.count') do
      post :create, schedule_alert: @schedule_alert.attributes
    end

    assert_redirected_to schedule_alert_path(assigns(:schedule_alert))
  end

  test "should show schedule_alert" do
    get :show, id: @schedule_alert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_alert
    assert_response :success
  end

  test "should update schedule_alert" do
    put :update, id: @schedule_alert, schedule_alert: @schedule_alert.attributes
    assert_redirected_to schedule_alert_path(assigns(:schedule_alert))
  end

  test "should destroy schedule_alert" do
    assert_difference('ScheduleAlert.count', -1) do
      delete :destroy, id: @schedule_alert
    end

    assert_redirected_to schedule_alerts_path
  end
end
