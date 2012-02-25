require 'test_helper'

class TimeConflictToTimeBlocksControllerTest < ActionController::TestCase
  setup do
    @time_conflict_to_time_block = time_conflict_to_time_blocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_conflict_to_time_blocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_conflict_to_time_block" do
    assert_difference('TimeConflictToTimeBlock.count') do
      post :create, time_conflict_to_time_block: @time_conflict_to_time_block.attributes
    end

    assert_redirected_to time_conflict_to_time_block_path(assigns(:time_conflict_to_time_block))
  end

  test "should show time_conflict_to_time_block" do
    get :show, id: @time_conflict_to_time_block
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_conflict_to_time_block
    assert_response :success
  end

  test "should update time_conflict_to_time_block" do
    put :update, id: @time_conflict_to_time_block, time_conflict_to_time_block: @time_conflict_to_time_block.attributes
    assert_redirected_to time_conflict_to_time_block_path(assigns(:time_conflict_to_time_block))
  end

  test "should destroy time_conflict_to_time_block" do
    assert_difference('TimeConflictToTimeBlock.count', -1) do
      delete :destroy, id: @time_conflict_to_time_block
    end

    assert_redirected_to time_conflict_to_time_blocks_path
  end
end
