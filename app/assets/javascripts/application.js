// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.timeago
//= require bootstrap
//= require bootstrap-datetimepicker
//= require_tree .


window.dialogLoad = function(url) {
    $.rails.ajax({
        url: url,
        success: function(data) {
            window.location.hash = url
            $('#mainDialog .dialog-content').html(data);
            $('#mainDialog').show();
        }
    })
};

$(document).on('click', '.dialog-box', function(e) {
    if (e.target == this) {
        window.location.hash = '';
        $(this).hide();
    }
});
/* a data-remote="true" */
$(document).on('ajax:success', 'a[data-remote]', function(e, data, status, xhr) {
    window.location.hash = $(e.target).attr('href');
    $('#mainDialog .dialog-content').html(data);
    $('#mainDialog').show();
});
$(document).on('ajax:before', 'a[data-remote]', function(e) {
    $('#mainDialog .dialog-content').empty();
    $('#mainDialog').show();
});
$(document).on('ajax:error', 'a[data-remote]', function(e, xhr, status, error) {
    console.error(error);
    $('#mainDialog').hide();
    alert(error);
});

/* form data-remote="true" */
$(document).on('ajax:error', 'form[data-remote]', function(e, xhr, status, error) {
    $(this).render_form_errors($.parseJSON(xhr.responseText));
});

$(document).ready(function() {
    if (window.location.hash) {
        var hashUrl = window.location.hash.substring(1);
        window.dialogLoad(hashUrl);
    }
});