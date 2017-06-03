require 'test_helper'

class LabFarsControllerTest < ActionController::TestCase
  setup do
    @lab_far = lab_fars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lab_fars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lab_far" do
    assert_difference('LabFar.count') do
      post :create, lab_far: { activo: @lab_far.activo, farmacia_id: @lab_far.farmacia_id, laboratorio_id: @lab_far.laboratorio_id }
    end

    assert_redirected_to lab_far_path(assigns(:lab_far))
  end

  test "should show lab_far" do
    get :show, id: @lab_far
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lab_far
    assert_response :success
  end

  test "should update lab_far" do
    patch :update, id: @lab_far, lab_far: { activo: @lab_far.activo, farmacia_id: @lab_far.farmacia_id, laboratorio_id: @lab_far.laboratorio_id }
    assert_redirected_to lab_far_path(assigns(:lab_far))
  end

  test "should destroy lab_far" do
    assert_difference('LabFar.count', -1) do
      delete :destroy, id: @lab_far
    end

    assert_redirected_to lab_fars_path
  end
end
