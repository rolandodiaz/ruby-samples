require 'test_helper'

class PagosControllerTest < ActionController::TestCase
  setup do
    @pago = pagos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pagos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pago" do
    assert_difference('Pago.count') do
      post :create, pago: { arbitrio: @pago.arbitrio, mora: @pago.mora }
    end

    assert_redirected_to pago_path(assigns(:pago))
  end

  test "should show pago" do
    get :show, id: @pago
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pago
    assert_response :success
  end

  test "should update pago" do
    put :update, id: @pago, pago: { arbitrio: @pago.arbitrio, mora: @pago.mora }
    assert_redirected_to pago_path(assigns(:pago))
  end

  test "should destroy pago" do
    assert_difference('Pago.count', -1) do
      delete :destroy, id: @pago
    end

    assert_redirected_to pagos_path
  end
end
