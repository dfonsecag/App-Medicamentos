require 'test_helper'

class DisponibilidadsControllerTest < ActionController::TestCase
  setup do
    @disponibilidad = disponibilidads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disponibilidads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disponibilidad" do
    assert_difference('Disponibilidad.count') do
      post :create, disponibilidad: { nombre: @disponibilidad.nombre }
    end

    assert_redirected_to disponibilidad_path(assigns(:disponibilidad))
  end

  test "should show disponibilidad" do
    get :show, id: @disponibilidad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disponibilidad
    assert_response :success
  end

  test "should update disponibilidad" do
    patch :update, id: @disponibilidad, disponibilidad: { nombre: @disponibilidad.nombre }
    assert_redirected_to disponibilidad_path(assigns(:disponibilidad))
  end

  test "should destroy disponibilidad" do
    assert_difference('Disponibilidad.count', -1) do
      delete :destroy, id: @disponibilidad
    end

    assert_redirected_to disponibilidads_path
  end
end
