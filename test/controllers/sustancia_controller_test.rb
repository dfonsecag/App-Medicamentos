require 'test_helper'

class SustanciaControllerTest < ActionController::TestCase
  setup do
    @sustancium = sustancia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sustancia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sustancium" do
    assert_difference('Sustancium.count') do
      post :create, sustancium: { descripcion: @sustancium.descripcion }
    end

    assert_redirected_to sustancium_path(assigns(:sustancium))
  end

  test "should show sustancium" do
    get :show, id: @sustancium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sustancium
    assert_response :success
  end

  test "should update sustancium" do
    patch :update, id: @sustancium, sustancium: { descripcion: @sustancium.descripcion }
    assert_redirected_to sustancium_path(assigns(:sustancium))
  end

  test "should destroy sustancium" do
    assert_difference('Sustancium.count', -1) do
      delete :destroy, id: @sustancium
    end

    assert_redirected_to sustancia_path
  end
end
