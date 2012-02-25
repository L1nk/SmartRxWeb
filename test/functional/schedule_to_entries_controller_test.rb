require 'test_helper'

class ScheduleToEntriesControllerTest < ActionController::TestCase
  setup do
    @schedule_to_entry = schedule_to_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_to_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_to_entry" do
    assert_difference('ScheduleToEntry.count') do
      post :create, schedule_to_entry: @schedule_to_entry.attributes
    end

    assert_redirected_to schedule_to_entry_path(assigns(:schedule_to_entry))
  end

  test "should show schedule_to_entry" do
    get :show, id: @schedule_to_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_to_entry
    assert_response :success
  end

  test "should update schedule_to_entry" do
    put :update, id: @schedule_to_entry, schedule_to_entry: @schedule_to_entry.attributes
    assert_redirected_to schedule_to_entry_path(assigns(:schedule_to_entry))
  end

  test "should destroy schedule_to_entry" do
    assert_difference('ScheduleToEntry.count', -1) do
      delete :destroy, id: @schedule_to_entry
    end

    assert_redirected_to schedule_to_entries_path
  end
end
