require 'test_helper'

class ProFarsControllerTest < ActionController::TestCase
  setup do
    @pro_far = pro_fars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pro_fars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pro_far" do
    assert_difference('ProFar.count') do
      post :create, pro_far: { activo: @pro_far.activo, disponibiliad_id: @pro_far.disponibiliad_id, farmacia_id: @pro_far.farmacia_id, producto_id: @pro_far.producto_id }
    end

    assert_redirected_to pro_far_path(assigns(:pro_far))
  end

  test "should show pro_far" do
    get :show, id: @pro_far
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pro_far
    assert_response :success
  end

  test "should update pro_far" do
    patch :update, id: @pro_far, pro_far: { activo: @pro_far.activo, disponibiliad_id: @pro_far.disponibiliad_id, farmacia_id: @pro_far.farmacia_id, producto_id: @pro_far.producto_id }
    assert_redirected_to pro_far_path(assigns(:pro_far))
  end

  test "should destroy pro_far" do
    assert_difference('ProFar.count', -1) do
      delete :destroy, id: @pro_far
    end

    assert_redirected_to pro_fars_path
  end
end
