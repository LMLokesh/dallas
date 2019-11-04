@extends('layouts.default')

@section('content')
    <div style="width:100vw">
    @include('settings.schedule.header')
        <div class="row">
            <div class="col-sm-0 col-md-1 col-lg-2"></div>
            <div class="col-sm-12 col-md-10 col-lg-8 card">
                <!-- <div class="card m-b-30"> -->
                    <div class="card-body pl-0 pr-0">
                        <h5 class="mt-0 pl-3"> {{($schedule_id)? 'Edit' : "Create" }} Schedule</h5><hr/>
                        <div class="row p0 m-0">
                            <input id="scheduleId" value="{{$schedule_id}}" class="d-none">
                            <form id="scheduleForm" class="col-sm-12 card p-2" >
                                <div class="row">
                    <div class="col-12">
                        <div class="card m-b-30">
                            <div class="card-body">

                                <!-- <h4 class="mt-0 header-title">Textual inputs</h4>
                                <p class="text-muted m-b-30 font-14">Here are examples of <code
                                        class="highlighter-rouge">.form-control</code> applied to each
                                    textual HTML5 <code class="highlighter-rouge">&lt;input&gt;</code> <code
                                            class="highlighter-rouge">type</code>.</p> -->

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-sm-2 col-form-label">Title</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="text" value="Artisanal kale" id="example-text-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-search-input" class="col-sm-2 col-form-label">Event Date</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="search" value="How do I shoot web" id="example-search-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Select Event</label>
                                    <div class="col-sm-10">
                                        <select class="form-control">
                                            <option>Select</option>
                                            <option>Large select</option>
                                            <option>Small select</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Notification Flag</label>
                                    <div class="col-sm-10">
                                        <select class="form-control">
                                            <option>Select</option>
                                            <option value="1">None</option>
                                            <option value="2">SMS</option>
                                            <option value="3">Email</option>
                                            <option value="4">Both</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Notification Flag</label>
                                    <div class="col-sm-10">
                                        <select class="form-control">
                                            <option>Select</option>
                                            <option value="1">None</option>
                                            <option value="2">SMS</option>
                                            <option value="3">Email</option>
                                            <option value="4">Both</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-url-input" class="col-sm-2 col-form-label">URL</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="url" value="https://getbootstrap.com" id="example-url-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-tel-input" class="col-sm-2 col-form-label">Telephone</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="tel" value="1-(555)-555-5555" id="example-tel-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-password-input" class="col-sm-2 col-form-label">Password</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="password" value="hunter2" id="example-password-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-number-input" class="col-sm-2 col-form-label">Number</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="number" value="42" id="example-number-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-datetime-local-input" class="col-sm-2 col-form-label">Date and time</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="datetime-local" value="2011-08-19T13:45:00" id="example-datetime-local-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-2 col-form-label">Date</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="date" value="2011-08-19" id="example-date-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-month-input" class="col-sm-2 col-form-label">Month</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="month" value="2011-08" id="example-month-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-week-input" class="col-sm-2 col-form-label">Week</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="week" value="2011-W33" id="example-week-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-time-input" class="col-sm-2 col-form-label">Time</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="time" value="13:45:00" id="example-time-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-color-input" class="col-sm-2 col-form-label">Color</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" type="color" value="#67a8e4" id="example-color-input">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Custom Select</label>
                                    <div class="col-sm-10">
                                        <select class="custom-select">
                                            <option selected>Open this select menu</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input-lg" class="col-sm-2 col-form-label">Large</label>
                                    <div class="col-sm-10">
                                        <input class="form-control form-control-lg" type="text" placeholder=".form-control-lg" id="example-text-input-lg">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input-sm" class="col-sm-2 col-form-label">Small</label>
                                    <div class="col-sm-10">
                                        <input class="form-control form-control-sm" type="text" placeholder=".form-control-sm" id="example-text-input-sm">
                                    </div>
                                </div>
                                <div class="form-group row has-success">
                                    <label for="inputHorizontalSuccess" class="col-sm-2 col-form-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control form-control-success" id="inputHorizontalSuccess" placeholder="name@example.com">
                                        <div class="form-control-feedback">Success! You've done it.</div>
                                        <small class="form-text text-muted">Example help text that remains unchanged.</small>
                                    </div>
                                </div>
                                <div class="form-group row has-warning">
                                    <label for="inputHorizontalWarning" class="col-sm-2 col-form-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control form-control-warning" id="inputHorizontalWarning" placeholder="name@example.com">
                                        <div class="form-control-feedback">Shucks, check the formatting of that and try again.</div>
                                        <small class="form-text text-muted">Example help text that remains unchanged.</small>
                                    </div>
                                </div>
                                <div class="form-group row has-danger">
                                    <label for="inputHorizontalDnger" class="col-sm-2 col-form-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control form-control-danger" id="inputHorizontalDnger" placeholder="name@example.com">
                                        <div class="form-control-feedback">Sorry, that username's taken. Try another?</div>
                                        <small class="form-text text-muted">Example help text that remains unchanged.</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div> <!-- end row -->
                            </form>
                        </div>
                    </div>
                <!-- </div> -->
            </div>
        </div>
    </div>

    <!-- <script src="{{ URL:: asset('js/settings/schedule/schedule.js')}}"></script> -->
@endsection