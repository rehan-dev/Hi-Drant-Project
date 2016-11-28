# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  jQuery ->
    $('#billentries').dataTable
      sPaginationType: 'full_numbers'
      bJQueryUI: true

$(document).on 'change', '#billentry_company_id', (evt) ->
  id = $('#billentry_company_id option:selected').val()
  jQuery.ajax
    url: '/billentries/company_data'
    type: 'GET'
    dataType: "json"
    data: data_id: id
    success: (data) ->
      if id
        $('#billentry_address').val(data.company_data[0].company_address)
        previous_balance = data.company_data[0].total_bill_amount - data.company_data[0].received_amount
        $('#billentry_previous_balance').val(previous_balance)

