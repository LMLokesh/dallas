@extends('layouts.default')

@section('content')
<!-- Page-Title -->
<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box">
            <div class="btn-group pull-right">
                <ol class="breadcrumb hide-phone p-0 m-0">
                    <li class="breadcrumb-item active">Position Management</li>
                </ol>
            </div>
            <!--<h4 class="page-title">Roles Management</h4>-->
            <!--<a href="{{URL::asset('role_create')}}" type="button" class="btn btn-primary waves-effect waves-light"><i class="fa fa-plus"></i>Add Role</a>-->
        </div>
    </div>
</div>
<!-- end page title end breadcrumb -->

<div class="row">
    <div class="col-lg-3">
        <div class="card m-b-30">
            <div class="card-body">
                <div class="button-items">
                    <a href="{{URL::asset('settings/position')}}" class="btn btn-primary btn-lg btn-block">Positions</a>
                    <a href="{{URL::asset('settings/team')}}" class="btn btn-primary btn-lg btn-block">Teams</a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-9">
        <div class="card m-b-30">
            <div class="card-body">

                <h4 class="mt-0 header-title">Positions <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-position">Add New</button></h4>

                <!-- <button type="button" class="btn btn-primary waves-effect waves-light" id="alertify-labels">Click me</button> -->
                
                <!-- -->
                <table id="positionTable" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Action</th>
                    </thead>


                    <tbody>

                    </tbody>
                </table>


            </div>
        </div>
    </div> <!-- end col -->




</div> <!-- end row -->


<div class="modal fade bs-example-modal-center" id="modal-position" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
    {!! Form::open(array('id'=>'positionCreateForm','name'=>'positionCreateForm','method' => 'post', 'url' => url('position_data_insert'), 'class' => '')) !!}
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title position_modal_title">Add Position</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body form-horizontal positionbody">
                <div class="form-group no-bg">
                    <label for="" class="col-sm-10 control-label text_align_right" style="text-align: left !important;">Position Name</label>
                    <div class="col-sm-9">
                        <input type="hidden" name="hidden_positionID" id="hidden_positionID" value="" />
                        <input type="text" class="form-control" id="name" name="name" placeholder="Position Name" maxlength="200">
                    </div>
                </div>
                <button type="button" class="btn btn-success margin pull-left" id="btnCreatePosition">Save</button>
                <button type="button" class="btn btn-danger margin pull-right" data-dismiss="modal">Cancel</button>
                <div class="clear"></div>
            </div>
        </div><!-- /.modal-content -->
    {!! Form::close() !!}
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 
<script>
    $(document).ready(function() {
        loadPositionDatatable();
    });

    function loadPositionDatatable() {

        positionTable = $('#positionTable').DataTable({
            "serverSide": true,
            "destroy": true,
            "autoWidth": false,
            "searching": true,
            "aaSorting": [
                [0, "desc"]
            ],
            "columnDefs": [{
                "targets": 0,
                "searchable": false,
                "visible": false
            }],
            "ajax": {
                type: "POST",
                data: {},
                url: siteUrl + '/settings/position/list',
            },
            "initComplete": function(settings, json) {
                // $("#eventsTable_filter").append('<button class="btn small btn-primary" id="eventDateSearch"  >Event Date</button>');

            }
        });
    }





    $('#modal-position').on('hidden.bs.modal', function() {
        $(".position_modal_title").html('');
        $(".position_modal_title").html('Add Position');
        $('.positionbody').find('select').val('');
        $('.positionbody').find('input').val('');

        var $alertas = $('#positionCreateForm');
        $alertas.validate().resetForm();
        $alertas.find('.error').removeClass('error');
    });


    $(document).ready(function() {


        chkValidateStatus = "";
        chkValidateStatus = $("#positionCreateForm").validate({
            //ignore:[],// false,
            ignore: false,
            errorClass: "error",
            rules: {
                name: {
                    required: true
                }

            },
            messages: {
                name: {
                    required: "Please select branch"
                }
            }
        });

    });



    //Save Position details to the database

    $("#btnCreatePosition").click(function() {
        
        var formObj = $('#positionCreateForm');
        var formData = new FormData(formObj[0]);

        $("#positionCreateForm").valid();

        var errorNumbers = chkValidateStatus.numberOfInvalids();
        
        if (errorNumbers == 0) {
            $.ajax({
                url: siteUrl + '/position_data_insert',
                async: true,
                type: "POST",
                data: formData,
                dataType: "html",
                contentType: false,
                cache: false,
                processData: false,
                success: function(data) {
                    $('#modal-position').modal('hide');
                    if (data == "updated") {
                        //alert("Position Updated");
                        //location.reload();
                        loadPositionDatatable();

                    } else if (data == "inserted") {
                        //alert("Position Added");
                        //location.reload();
                        loadPositionDatatable();

                    } else {
                        alert("Error in Updation");
                        return false;
                    }
                }

            });

        } else {

        }
    });

    //form submission
    $('#positionCreateForm').submit(function(e) {
        var errorNumbers = chkValidateStatus.numberOfInvalids();
        if (errorNumbers == 0) {
            return true;
        } else {

        }
    });

    //Edit the Positions data
    function edit_position(positionID) {
        $(".position_modal_title").html('');
        $(".position_modal_title").html('Edit Position');
        var dataString = 'positionID=' + positionID;

        $.ajax({
            url: siteUrl + '/settings/get_position_by_id',
            async: true,
            type: "GET",
            data: dataString,
            dataType: "json",
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                //console.log(data);
                //location.reload();
                $('#modal-position').modal('show');
                $("#hidden_positionID").val(data.id);
                $("#name").val(data.name);

            }
        });

    }

    
//Delete the position data
function position_data_delete(positionId)
{
    
    alertify.confirm("Are you sure you want to delete?", function (asc) {
         if (asc) {
             //ajax call for delete    
             var dataString = 'positionId=' + positionId;

             $.ajax({
                url: siteUrl + '/settings/position_data_delete',
                async: true,
                type: "GET",
                data: dataString,
                dataType: "html",
                contentType: false,
                cache: false,
                processData: false,
                success: function (data)
                {
                    //location.reload();
                    loadPositionDatatable();

                }
            });   
             alertify.success("Record is deleted.");

         } else {
             alertify.error("You've clicked cancel");
         }
     },"Default Value");
    /*

    , 
     // theme settings
     theme:{
            // class name attached to prompt dialog input textbox.
            input:'ajs-input',
            // class name attached to ok button
            ok:'ajs-ok',
            // class name attached to cancel button 
            cancel:'ajs-cancel'
        }


    var dataString = 'positionId=' + positionId;

    bootbox.confirm({
        title: "Confirm",
        message: "<h4 id='modal_content'>Do you want to continue to delete this Position?</h4>",
        buttons: {
            cancel: {
                label: '<i class="fa fa-times"></i> No',
                className: 'btn-danger'
            },
            confirm: {
                label: '<i class="fa fa-check"></i> Confirm',
                className: 'btn-success'
            }
        },
        callback: function (result) {
            if (result === true) {
                $.ajax({
                    url: siteUrl + '/position_data_delete',
                    async: true,
                    type: "GET",
                    data: dataString,
                    dataType: "html",
                    contentType: false,
                    cache: false,
                    processData: false,
                    success: function (data)
                    {
                        //location.reload();
                        loadPositionDatatable();

                    }
                })
            }
            else
            {

            }
        }
    });
    */
 }


</script>

@endsection