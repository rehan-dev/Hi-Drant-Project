require 'test_helper'

class BillentriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @billentry = billentries(:one)
  end

  test "should get index" do
    get billentries_url
    assert_response :success
  end

  test "should get new" do
    get new_billentry_url
    assert_response :success
  end

  test "should create billentry" do
    assert_difference('Billentry.count') do
      post billentries_url, params: { billentry: { address: @billentry.address, company_name: @billentry.company_name, current_date: @billentry.current_date, current_total_amount: @billentry.current_total_amount, net_balance: @billentry.net_balance, previous_amount: @billentry.previous_amount, recieved_amount: @billentry.recieved_amount, supply_rate: @billentry.supply_rate, time_arrive: @billentry.time_arrive, time_departure: @billentry.time_departure, total_amount: @billentry.total_amount, truck_no: @billentry.truck_no, weight: @billentry.weight } }
    end

    assert_redirected_to billentry_url(Billentry.last)
  end

  test "should show billentry" do
    get billentry_url(@billentry)
    assert_response :success
  end

  test "should get edit" do
    get edit_billentry_url(@billentry)
    assert_response :success
  end

  test "should update billentry" do
    patch billentry_url(@billentry), params: { billentry: { address: @billentry.address, company_name: @billentry.company_name, current_date: @billentry.current_date, current_total_amount: @billentry.current_total_amount, net_balance: @billentry.net_balance, previous_amount: @billentry.previous_amount, recieved_amount: @billentry.recieved_amount, supply_rate: @billentry.supply_rate, time_arrive: @billentry.time_arrive, time_departure: @billentry.time_departure, total_amount: @billentry.total_amount, truck_no: @billentry.truck_no, weight: @billentry.weight } }
    assert_redirected_to billentry_url(@billentry)
  end

  test "should destroy billentry" do
    assert_difference('Billentry.count', -1) do
      delete billentry_url(@billentry)
    end

    assert_redirected_to billentries_url
  end
end
