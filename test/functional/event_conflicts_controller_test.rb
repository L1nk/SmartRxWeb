require 'test_helper'

class EventConflictsControllerTest < ActionController::TestCase
  setup do
    @event_conflict = event_conflicts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_conflicts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_conflict" do
    assert_difference('EventConflict.count') do
      post :create, event_conflict: @event_conflict.attributes
    end

    assert_redirected_to event_conflict_path(assigns(:event_conflict))
  end

  test "should show event_conflict" do
    get :show, id: @event_conflict
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_conflict
    assert_response :success
  end

  test "should update event_conflict" do
    put :update, id: @event_conflict, event_conflict: @event_conflict.attributes
    assert_redirected_to event_conflict_path(assigns(:event_conflict))
  end

  test "should destroy event_conflict" do
    assert_difference('EventConflict.count', -1) do
      delete :destroy, id: @event_conflict
    end

    assert_redirected_to event_conflicts_path
  end
end
