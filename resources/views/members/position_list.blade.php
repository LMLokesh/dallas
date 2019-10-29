@extends('layouts.default')

@section('content')
<!-- Page-Title -->
<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box">
            <div class="btn-group pull-right">
                <ol class="breadcrumb hide-phone p-0 m-0">
                    <li class="breadcrumb-item ">Member Directory</li>
                    <li class="breadcrumb-item active">Member Profile</li>
                </ol>
            </div>
            <!--<h4 class="page-title">Member Directory</h4>-->

        </div>
    </div>
</div>
<!-- end page title end breadcrumb -->

<div class="row">
    
    @include('members.member_profile_header_block')

</div>
<link href="{{ URL::asset('assets/select2/select2.css') }}" rel="stylesheet" type="text/css" />
<script src="{{ URL:: asset('assets/select2/select2.js')}}"></script>
<div class="row">
    <div class="col-lg-3">

        @include('members.member_profile_sidebar')

    </div>

    <div class="col-lg-6">
        <div class="card m-b-30">
            <div class="card-header">
                Position
                <?php
                $selPosIds='';
                if($selectFromUserHasPosition->count() > 0){
                    $selPosIds = implode(",", array_column($selectFromUserHasPosition->toArray(), 'position_id')); 
                }
                
                ?>

            </div>
            
            <div>
                <select class="form-control select2" id="user_pos_id" name="user_pos_id[]" multiple="multiple">
                    <option>--Select--</option>
                    <?php
                    if($selectFromPosition->count() > 0){
                        foreach ($selectFromPosition as $selectFromPositionvalue) {
                        ?>
                            <option value="{{$selectFromPositionvalue->id}}">{{$selectFromPositionvalue->name}}</option>
                        <?php
                        }                    
                    }
                    ?>
                </select>

                <button name="btnUpdUserPosition" id="btnUpdUserPosition" class="btn btn-primary">Update</button>
            </div>
            
        </div>
    </div>

    <div class="col-lg-3" id="household-blocks">
        
    </div>

</div>
<!-- end row -->




<script type="text/javascript">
    $(".select2").select2();
    $(".select2").val([<?php echo $selPosIds;?>]).change();;


$("#btnUpdUserPosition").click(function () {

     
        $.ajax({
            url: siteUrl + '/update_user_positions',
            async: true,
            type: "POST",
            data: formData,
            dataType: "html",
            contentType: false,
            cache: false,
            processData: false,
            success: function (data)
            {
                
                
                 
            }

        }); 
});
</script>


@endsection