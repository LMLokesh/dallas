
function eventDateChanged(ev) {

    //alert("selecteventdate2"+ev.target.value);
    var datastring = "event_date="+ev.target.value;
    //alert(datastring+"--"+siteUrl);
    $.ajax({
        url: siteUrl + '/events/get_events_upon_date/'+ev.target.value,
        async: true,
        type: "GET",
        data: datastring,
        dataType: "html",
        // contentType: false,
        // cache: false,
        // processData: false,
        success: function (data)
        {
            //alert(data);
            //console.log(data);			
            $("#load_events").html(data);
            $("#event_id").val($("#event_id_hidden").val()).change();
        }

    }); 
    // $(this).datepicker('hide');
    // if ($('#startdate').val() != '' && $('#enddate').val() != '') {
    //     $('#period').text(diffInDays() + ' d.');
    // } else {
    //     $('#period').text("-");
    // }
}
