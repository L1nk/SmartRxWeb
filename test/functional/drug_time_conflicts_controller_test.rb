require 'test_helper'

class DrugTimeConflictsControllerTest < ActionController::TestCase
  setup do
    @drug_time_conflict = drug_time_conflicts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drug_time_conflicts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drug_time_conflict" do
    assert_difference('DrugTimeConflict.count') do
      post :create, drug_time_conflict: @drug_time_conflict.attributes
    end

    assert_redirected_to drug_time_conflict_path(assigns(:drug_time_conflict))
  end

  test "should show drug_time_conflict" do
    get :show, id: @drug_time_conflict
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drug_time_conflict
    assert_response :success
  end

  test "should update drug_time_conflict" do
    put :update, id: @drug_time_conflict, drug_time_conflict: @drug_time_conflict.attributes
    assert_redirected_to drug_time_conflict_path(assigns(:drug_time_conflict))
  end

  test "should destroy drug_time_conflict" do
    assert_difference('DrugTimeConflict.count', -1) do
      delete :destroy, id: @drug_time_conflict
    end

    assert_redirected_to drug_time_conflicts_path
  end
end
