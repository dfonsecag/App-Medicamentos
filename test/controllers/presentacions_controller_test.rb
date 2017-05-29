require 'test_helper'

class PresentacionsControllerTest < ActionController::TestCase
  setup do
    @presentacion = presentacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presentacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presentacion" do
    assert_difference('Presentacion.count') do
      post :create, presentacion: { descripcion: @presentacion.descripcion }
    end

    assert_redirected_to presentacion_path(assigns(:presentacion))
  end

  test "should show presentacion" do
    get :show, id: @presentacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presentacion
    assert_response :success
  end

  test "should update presentacion" do
    patch :update, id: @presentacion, presentacion: { descripcion: @presentacion.descripcion }
    assert_redirected_to presentacion_path(assigns(:presentacion))
  end

  test "should destroy presentacion" do
    assert_difference('Presentacion.count', -1) do
      delete :destroy, id: @presentacion
    end

    assert_redirected_to presentacions_path
  end
end
