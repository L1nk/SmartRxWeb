require 'test_helper'

class ScheduleDrugsConflictsControllerTest < ActionController::TestCase
  setup do
    @schedule_drugs_conflict = schedule_drugs_conflicts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_drugs_conflicts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_drugs_conflict" do
    assert_difference('ScheduleDrugsConflict.count') do
      post :create, schedule_drugs_conflict: @schedule_drugs_conflict.attributes
    end

    assert_redirected_to schedule_drugs_conflict_path(assigns(:schedule_drugs_conflict))
  end

  test "should show schedule_drugs_conflict" do
    get :show, id: @schedule_drugs_conflict
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_drugs_conflict
    assert_response :success
  end

  test "should update schedule_drugs_conflict" do
    put :update, id: @schedule_drugs_conflict, schedule_drugs_conflict: @schedule_drugs_conflict.attributes
    assert_redirected_to schedule_drugs_conflict_path(assigns(:schedule_drugs_conflict))
  end

  test "should destroy schedule_drugs_conflict" do
    assert_difference('ScheduleDrugsConflict.count', -1) do
      delete :destroy, id: @schedule_drugs_conflict
    end

    assert_redirected_to schedule_drugs_conflicts_path
  end
end
