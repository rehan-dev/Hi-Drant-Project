# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->

$(document).on 'click', '#fetchdata', (evt) ->
  bill_date_from = $('#bill_date_from').val()
  bill_date_to = $('#bill_date_to').val()

  if($('#bill_no option:selected').val())
    bill_no = $('#bill_no option:selected').val()
    window.open('/report_print?bill_no='+ bill_no, '_self')

  if(bill_no && bill_date_from)
    alert("please don't select date when Bill No selected")
    document.getElementById('error_log').innerHTML = 'You are not allowed to select date when using single bill report'
    return 0
  if(bill_no && bill_date_to)
    alert("please don't select date when Bill No selected")
    document.getElementById('error_log').innerHTML = 'You are not allowed to select date when using single bill report'
    return 0
  if(bill_no && bill_date_from && bill_date_to)
    alert("please don't select date when Bill No selected")
    document.getElementById('error_log').innerHTML = 'You are not allowed to select date when using single bill report'
    return 0

  if($('#company_name option:selected').val())
    company_id = $('#company_name option:selected').val()
    window.open('/report_print?company_id='+ company_id, '_self')

  if(company_id && bill_date_from)
    window.open('/report_print?company_id='+ company_id + '&date_from=' + bill_date_from, '_self')
  if(company_id && bill_date_to)
    window.open('/report_print?company_id='+ company_id + '&date_to=' + bill_date_to, '_self')
  if(company_id && bill_date_from && bill_date_to)
    window.open('/report_print?company_id='+ company_id + '&date_from=' + bill_date_from + '&date_to=' + bill_date_to, '_self')

  if (!company_id && bill_date_from)
    alert("please select company first then select date")
    document.getElementById('error_log').innerHTML = 'please select company first then select date'
    return 0
  if (!company_id && bill_date_to)
    alert("please select company first then select date")
    document.getElementById('error_log').innerHTML = 'please select company first then select date'
    return 0
  if (!company_id && bill_date_from && bill_date_to)
    alert("please select company first then select date")
    document.getElementById('error_log').innerHTML = 'please select company first then select date'
    return 0

#$(document).on 'click', '#bw_Show', (evt) ->
#  $('#bill_no option[disabled]:selected')
#  $('#dis-bill-no').toggle @checked