// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function toTitleCase(str) {
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}

function removeSpecialChars(str) {
    return str.replace(/[^\w\s]/gi, '');
}

$(document).ready(function(){
    $('input.btn.title_case').click(function(){
        var $band_name_box = $('input.band_name.string');
        $band_name_box.val(toTitleCase($band_name_box.val()));
    });

    $('input.btn.remove_special_chars').click(function(){
        var $band_name_box = $('input.band_name.string');
        $band_name_box.val(removeSpecialChars($band_name_box.val()));
    });
});
