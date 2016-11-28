// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require dataTables/jquery.dataTables
//= require turbolinks
//= require_tree .

// $(document).on('change', '#billentry_company_id', function(evt) {
//     var id;
//     id = $("#billentry_company_id option:selected").val();
//     console.log(id);
//     return jQuery.ajax({
//         url: '/billentries/company_data',
//         type: 'get',
//         data: {
//             data_id: id
//         },
//         success: function(data) {
//             return console.log(gon.values);
//             $('#address').val("hack");
//         }
//     });
// });