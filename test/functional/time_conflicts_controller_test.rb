require 'test_helper'

class TimeConflictsControllerTest < ActionController::TestCase
  setup do
    @time_conflict = time_conflicts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_conflicts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_conflict" do
    assert_difference('TimeConflict.count') do
      post :create, time_conflict: @time_conflict.attributes
    end

    assert_redirected_to time_conflict_path(assigns(:time_conflict))
  end

  test "should show time_conflict" do
    get :show, id: @time_conflict
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_conflict
    assert_response :success
  end

  test "should update time_conflict" do
    put :update, id: @time_conflict, time_conflict: @time_conflict.attributes
    assert_redirected_to time_conflict_path(assigns(:time_conflict))
  end

  test "should destroy time_conflict" do
    assert_difference('TimeConflict.count', -1) do
      delete :destroy, id: @time_conflict
    end

    assert_redirected_to time_conflicts_path
  end
end
