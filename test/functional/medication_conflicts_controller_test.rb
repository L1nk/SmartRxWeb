require 'test_helper'

class MedicationConflictsControllerTest < ActionController::TestCase
  setup do
    @medication_conflict = medication_conflicts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medication_conflicts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medication_conflict" do
    assert_difference('MedicationConflict.count') do
      post :create, medication_conflict: @medication_conflict.attributes
    end

    assert_redirected_to medication_conflict_path(assigns(:medication_conflict))
  end

  test "should show medication_conflict" do
    get :show, id: @medication_conflict
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medication_conflict
    assert_response :success
  end

  test "should update medication_conflict" do
    put :update, id: @medication_conflict, medication_conflict: @medication_conflict.attributes
    assert_redirected_to medication_conflict_path(assigns(:medication_conflict))
  end

  test "should destroy medication_conflict" do
    assert_difference('MedicationConflict.count', -1) do
      delete :destroy, id: @medication_conflict
    end

    assert_redirected_to medication_conflicts_path
  end
end
