require 'test_helper'

class PointTransactionsControllerTest < ActionController::TestCase
  setup do
    @point_transaction = point_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:point_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create point_transaction" do
    assert_difference('PointTransaction.count') do
      post :create, point_transaction: { points: @point_transaction.points, transaction_type: @point_transaction.transaction_type }
    end

    assert_redirected_to point_transaction_path(assigns(:point_transaction))
  end

  test "should show point_transaction" do
    get :show, id: @point_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @point_transaction
    assert_response :success
  end

  test "should update point_transaction" do
    put :update, id: @point_transaction, point_transaction: { points: @point_transaction.points, transaction_type: @point_transaction.transaction_type }
    assert_redirected_to point_transaction_path(assigns(:point_transaction))
  end

  test "should destroy point_transaction" do
    assert_difference('PointTransaction.count', -1) do
      delete :destroy, id: @point_transaction
    end

    assert_redirected_to point_transactions_path
  end
end
