$(document).ready(function () {
    tabAccess = ['projects', 'users', 'groups', 'permissions', 'trackers', 'statuses', 'workflow', 'custom_field', 'enumerations', 'settings', 'ldap', 'plugins', 'information']

    checkboxPartialAdmin = $('#user_partial_admin');
    checkboxAdmin = $('#user_admin');

    checkboxAdmin.click(function () {
        if (checkboxPartialAdmin.prop("checked") == true) {
            checkboxPartialAdmin.prop("checked", false);
            $('#partial_admin_access').html('');
        }
    });

    checkboxPartialAdmin.click(function() {
        if (checkboxAdmin.prop("checked") == true) {
            checkboxAdmin.prop("checked", false);
        }
        if($(this).prop("checked") == true){
            $.each(tabAccess, function(index,value) {
                var pElt = $('<p></p>');
                var labelElt = $('<label></label>');
                var input = $('<input>');
                labelElt.attr("for", value);
                labelElt.text(value);
                input.attr('type','checkbox');
                input.attr('name', 'user[access]['+value+']');
                input.attr('value', value);
                pElt.append(labelElt);
                pElt.append(input);
                $('#partial_admin_access').append(pElt);
            });
        }
        else {
            $('#partial_admin_access').html('');
        }
    })
});