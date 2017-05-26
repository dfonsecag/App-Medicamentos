require 'test_helper'

class PlanPacientesControllerTest < ActionController::TestCase
  setup do
    @plan_paciente = plan_pacientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plan_pacientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plan_paciente" do
    assert_difference('PlanPaciente.count') do
      post :create, plan_paciente: { laboratorio_id: @plan_paciente.laboratorio_id, nombre: @plan_paciente.nombre }
    end

    assert_redirected_to plan_paciente_path(assigns(:plan_paciente))
  end

  test "should show plan_paciente" do
    get :show, id: @plan_paciente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plan_paciente
    assert_response :success
  end

  test "should update plan_paciente" do
    patch :update, id: @plan_paciente, plan_paciente: { laboratorio_id: @plan_paciente.laboratorio_id, nombre: @plan_paciente.nombre }
    assert_redirected_to plan_paciente_path(assigns(:plan_paciente))
  end

  test "should destroy plan_paciente" do
    assert_difference('PlanPaciente.count', -1) do
      delete :destroy, id: @plan_paciente
    end

    assert_redirected_to plan_pacientes_path
  end
end
