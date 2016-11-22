require 'test_helper'

class ReceivablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receivable = receivables(:one)
  end

  test "should get index" do
    get receivables_url
    assert_response :success
  end

  test "should get new" do
    get new_receivable_url
    assert_response :success
  end

  test "should create receivable" do
    assert_difference('Receivable.count') do
      post receivables_url, params: { receivable: { check_date: @receivable.check_date, company_id: @receivable.company_id, receiveable_amount: @receivable.receiveable_amount, remarks: @receivable.remarks, transaction_date: @receivable.transaction_date } }
    end

    assert_redirected_to receivable_url(Receivable.last)
  end

  test "should show receivable" do
    get receivable_url(@receivable)
    assert_response :success
  end

  test "should get edit" do
    get edit_receivable_url(@receivable)
    assert_response :success
  end

  test "should update receivable" do
    patch receivable_url(@receivable), params: { receivable: { check_date: @receivable.check_date, company_id: @receivable.company_id, receiveable_amount: @receivable.receiveable_amount, remarks: @receivable.remarks, transaction_date: @receivable.transaction_date } }
    assert_redirected_to receivable_url(@receivable)
  end

  test "should destroy receivable" do
    assert_difference('Receivable.count', -1) do
      delete receivable_url(@receivable)
    end

    assert_redirected_to receivables_url
  end
end
