require 'test_helper'

class MedicationConflictToMedicationsControllerTest < ActionController::TestCase
  setup do
    @medication_conflict_to_medication = medication_conflict_to_medications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medication_conflict_to_medications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medication_conflict_to_medication" do
    assert_difference('MedicationConflictToMedication.count') do
      post :create, medication_conflict_to_medication: @medication_conflict_to_medication.attributes
    end

    assert_redirected_to medication_conflict_to_medication_path(assigns(:medication_conflict_to_medication))
  end

  test "should show medication_conflict_to_medication" do
    get :show, id: @medication_conflict_to_medication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medication_conflict_to_medication
    assert_response :success
  end

  test "should update medication_conflict_to_medication" do
    put :update, id: @medication_conflict_to_medication, medication_conflict_to_medication: @medication_conflict_to_medication.attributes
    assert_redirected_to medication_conflict_to_medication_path(assigns(:medication_conflict_to_medication))
  end

  test "should destroy medication_conflict_to_medication" do
    assert_difference('MedicationConflictToMedication.count', -1) do
      delete :destroy, id: @medication_conflict_to_medication
    end

    assert_redirected_to medication_conflict_to_medications_path
  end
end
