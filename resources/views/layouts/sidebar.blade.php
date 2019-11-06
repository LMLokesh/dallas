<!-- Navigation Bar-->
        <header id="topnav">
            <div class="topbar-main">
                <div class="container-fluid">

                    <!-- Logo container-->
                    <div class="logo">
                        <!-- Text Logo -->
                        <!--<a href="index.html" class="logo">-->
                        {{ Config::get('constants.BROWSERTITLE') }}
                        <!--</a>-->
                        <!-- Image Logo -->
                        <?php
                        //dd("adad");
                        $userSessionData = Session::get('userSessionData');
                        $whereArray = array('orgId' => $userSessionData['umOrgId']);
                        // dd($whereArray);
                        $crudOrganization = \App\Models\Organization::crudOrganization($whereArray,null,null,null,null,null,null,'1')->get();
                        //dd($userSessionData);
                        ?>
                        @if ($crudOrganization->count() > 0)
                            @if($crudOrganization[0]->orgLogo == "")
                                @php ($orgLogoName = "bible-cross-logo.png")
                            @else
                                @php ($orgLogoName = $crudOrganization[0]->orgId.'/org_logo/'.$crudOrganization[0]->orgLogo)
                            @endif

                            <a href="" class="logo"><img src="{{ URL::asset('assets/uploads/organizations/'.$orgLogoName)}}" alt="" height="55" class="logo-large"></a>

                        @else
                            <a href="" class="logo"><img src="{{ URL::asset('assets/theme/images/bible-cross-logo1.png')}}" alt="" height="55" class="logo-large"></a>
                        @endif

                        <!-- <a href="index.html" class="logo">
                            <img src="{{ URL::asset('assets/theme/images/bible-cross-logo1.png')}}" alt="" height="22" class="logo-small">
                            <img src="{{ URL::asset('assets/theme/images/bible-cross-logo1.png')}}" alt="" height="55" class="logo-large">
                        </a> -->

                    </div>
                    <!-- End Logo container-->
                    <?php
                    $url_segment_one =  \Request::segment(1);
                    $url_segment_two =  \Request::segment(2);
                    $url_segment_three =  \Request::segment(3);
                    ?>

                    <div class="menu-extras topbar-custom">

                        <!-- Search input -->

                        <ul class="list-inline float-right mb-0">

                            <!-- Messages-->
                            <li class="list-inline-item dropdown notification-list">
                                <a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#" role="button"
                                   aria-haspopup="false" aria-expanded="false">
                                    <i class="mdi mdi-email-outline noti-icon"></i>
                                    <span class="badge badge-danger noti-icon-badge">3</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-menu-lg">
                                    <!-- item-->
                                    <div class="dropdown-item noti-title">
                                        <h5><span class="badge badge-danger float-right">745</span>Messages</h5>
                                    </div>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon"><img src="{{ URL::asset('assets/theme/images/users/avatar-2.jpg')}}" alt="user-img" class="img-fluid rounded-circle" /> </div>
                                        <p class="notify-details"><b>Charles M. Jones</b><small class="text-muted">Dummy text of the printing and typesetting industry.</small></p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon"><img src="{{ URL::asset('assets/theme/images/users/avatar-3.jpg')}}" alt="user-img" class="img-fluid rounded-circle" /> </div>
                                        <p class="notify-details"><b>Thomas J. Mimms</b><small class="text-muted">You have 87 unread messages</small></p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon"><img src="{{ URL::asset('assets/theme/images/users/avatar-4.jpg')}}" alt="user-img" class="img-fluid rounded-circle" /> </div>
                                        <p class="notify-details"><b>Luis M. Konrad</b><small class="text-muted">It is a long established fact that a reader will</small></p>
                                    </a>

                                    <!-- All-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        View All
                                    </a>

                                </div>
                            </li>
                            <!-- notification-->
                            <li class="list-inline-item dropdown notification-list">
                                <a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#" role="button"
                                   aria-haspopup="false" aria-expanded="false">
                                    <i class="mdi mdi-bell-outline noti-icon"></i>
                                    <span class="badge badge-danger noti-icon-badge">3</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-menu-lg">
                                    <!-- item-->
                                    <div class="dropdown-item noti-title">
                                        <h5>Notification (3)</h5>
                                    </div>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item active">
                                        <div class="notify-icon bg-success"><i class="mdi mdi-cart-outline"></i></div>
                                        <p class="notify-details"><b>Your order is placed</b><small class="text-muted">Dummy text of the printing and typesetting industry.</small></p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-warning"><i class="mdi mdi-message"></i></div>
                                        <p class="notify-details"><b>New Message received</b><small class="text-muted">You have 87 unread messages</small></p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-info"><i class="mdi mdi-martini"></i></div>
                                        <p class="notify-details"><b>Your item is shipped</b><small class="text-muted">It is a long established fact that a reader will</small></p>
                                    </a>

                                    <!-- All-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        View All
                                    </a>

                                </div>
                            </li>
                            <!-- User-->
                            <li class="list-inline-item dropdown notification-list">
                                <a class="nav-link dropdown-toggle arrow-none waves-effect nav-user" data-toggle="dropdown" href="#" role="button"
                                   aria-haspopup="false" aria-expanded="false">
                                    <img src="{{ URL::asset('assets/theme/images/users/avatar-1.jpg')}}" alt="user" class="rounded-circle">
                                </a>
                                <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                    <a class="dropdown-item" href="#"><i class="dripicons-user text-muted"></i> Profile</a>
                                    <!-- <a class="dropdown-item" href="#"><i class="dripicons-wallet text-muted"></i> My Wallet</a> -->
                                    <a class="dropdown-item" href="#"><span class="badge badge-success pull-right m-t-5">5</span><i class="dripicons-gear text-muted"></i> Settings</a>
                                    <!-- <a class="dropdown-item" href="#"><i class="dripicons-lock text-muted"></i> Lock screen</a> -->
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="{{URL::asset('webapp/logout').'/'.$crudOrganization[0]->orgDomain}}"><i class="dripicons-exit text-muted"></i> Logout</a>
                                </div>
                            </li>
                            <li class="menu-item list-inline-item">
                                <!-- Mobile menu toggle-->
                                <a class="navbar-toggle nav-link">
                                    <div class="lines">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                </a>
                                <!-- End mobile menu toggle-->
                            </li>

                        </ul>
                    </div>
                    <!-- end menu-extras -->

                    <div class="clearfix"></div>

                </div> <!-- end container -->
            </div>
            <!-- end topbar-main -->

            <!-- MENU Start -->
            <div class="navbar-custom">
                <div class="container-fluid">
                    <div id="navigation">
                        <!-- Navigation Menu-->
                        <ul class="navigation-menu">

                            <li @if($url_segment_one == "home") class='has-submenu active' @else class='has-submenu' @endif><a href="{{URL::asset('home')}}"><i class="ti-home"></i>Dashboard</a></li>

                            <li class="has-submenu">
                                <a href="#"><i class="ti-light-bulb"></i>Member</a>
                                <ul class="submenu megamenu">
                                    <li>
                                        <ul>
                                            <li @if($url_segment_two == "member_directory") class='active' @else @endif><a href="{{URL::asset('people/member_directory')}}"> Member Directory</a></li>
                                            <li @if($url_segment_one == "role_management") class='active' @else @endif><a href="{{URL::asset('role_management')}}"> Role Management</a></li>
<!--                                            <li><a href="ui-cards.html">Cards</a></li>
                                            <li><a href="ui-tabs-accordions.html">Tabs &amp; Accordions</a></li>
                                            <li><a href="ui-modals.html">Modals</a></li>
                                            <li><a href="ui-images.html">Images</a></li>
                                            <li><a href="ui-alerts.html">Alerts</a></li>-->
                                        </ul>
                                    </li>

<!--                                    <li>
                                        <ul>
                                            <li><a href="ui-progressbars.html">Progress Bars</a></li>
                                            <li><a href="ui-dropdowns.html">Dropdowns</a></li>
                                            <li><a href="ui-lightbox.html">Lightbox</a></li>
                                            <li><a href="ui-navs.html">Navs</a></li>
                                            <li><a href="ui-pagination.html">Pagination</a></li>
                                            <li><a href="ui-popover-tooltips.html">Popover & Tooltips</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <ul>
                                            <li><a href="ui-badge.html">Badge</a></li>
                                            <li><a href="ui-carousel.html">Carousel</a></li>
                                            <li><a href="ui-video.html">Video</a></li>
                                            <li><a href="ui-typography.html">Typography</a></li>
                                            <li><a href="ui-sweet-alert.html">Sweet-Alert</a></li>
                                            <li><a href="ui-grid.html">Grid</a></li>
                                        </ul>
                                    </li>-->
                                </ul>
                            </li>

                            <!-- <li class="has-submenu">
                                <a href="#"><i class="ti-crown"></i>Nextgen Check-in</a>
                                <ul class="submenu">
                                    <li @if($url_segment_one == "checkin") class='active' @else @endif><a href="{{URL::asset('checkin')}}"> Nextgen Check-in</a></li>
                                    <li @if($url_segment_one == "checkin" && $url_segment_two == "adult") class='active' @else @endif><a href="{{URL::asset('checkin/adult')}}"> Adult Checkin</a></li>
                                    <li @if($url_segment_one == "checkin" && $url_segment_two == "child") class='active' @else @endif><a href="{{URL::asset('checkin/child')}}"> Child Checkin</a></li>
                                    <li @if($url_segment_one == "checkin" && $url_segment_two == "notification") class='active' @else @endif><a href="{{URL::asset('checkin/notification')}}"> Notification</a></li>
                                    <li @if($url_segment_one == "checkin" && $url_segment_two == "report") class='active' @else @endif><a href="{{URL::asset('checkin/report')}}"> Report</a></li>


                                </ul>
                            </li> -->
                            <!-- <li @if($url_segment_one == "communication") class='has-submenu active' @else class='has-submenu' @endif><a href="{{URL::asset('communication')}}"> Communication</a></li> -->
                            <li @if($url_segment_one == "events") class='has-submenu active' @else class='has-submenu' @endif><a href="{{URL::asset('events')}}"> <i class="ti-crown"></i> Events</a></li>
                            <li @if($url_segment_one == "paster_board") class='has-submenu active' @else class='has-submenu' @endif><a href="{{URL::asset('pastor_board')}}"> <i class="ti-crown"></i> Pastor Board</a></li>

                            <li class="has-submenu">
                                <a href="#"><i class="ti-settings"></i>Settings</a>
                                <ul class="submenu">
                                    <li @if($url_segment_one == "settings") class='active' @else @endif>
                                        <a href="{{URL::asset('/settings/communication')}}">Communication</a>
                                    </li>
                                    <li @if($url_segment_one == "settings") class='active' @else @endif>
                                        <a href="{{URL::asset('/settings/forms')}}">Forms</a>
                                    </li>
                                    <li @if($url_segment_one == "settings") class='active' @else @endif>
                                        <a href="{{URL::asset('/settings/schedulling')}}">Schedlling</a>
                                    </li>
                                     <li @if($url_segment_one == "settings") class='active' @else @endif>
                                        <a href="{{URL::asset('/settings/asset_management/resources')}}">Asset Management</a>
                                    </li>
                                    <li @if($url_segment_one == "settings") class='active' @else @endif>
                                        <a href="{{URL::asset('/settings/location')}}">Location</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="has-submenu {{request()->is('groups/*') ? 'active' : ''}}">
                                <a href="#" class="{{request()->is('groups/*') ? 'active' : ''}}"><i class="ti-layout-grid3"></i>Groups</a>
                                <ul class="submenu">
                                    <li @if($url_segment_one == "settings") class='active' @else @endif>
                                        <a href="{{URL::asset('/groups')}}">Groups</a>
                                    </li>
                                    <li @if($url_segment_one == "settings") class='active' @else @endif>
                                        <a href="{{URL::asset('/groups/tags')}}">Tags</a>
                                    </li>
                                     <li @if($url_segment_one == "settings") class='active' @else @endif>
                                        <a href="{{URL::asset('/groups/people')}}">People</a>
                                    </li>
                                </ul>
                            </li>


                        </ul>
                        <!-- End navigation menu -->
                    </div> <!-- end #navigation -->
                </div> <!-- end container -->
            </div> <!-- end navbar-custom -->
        </header>
        <!-- End Navigation Bar-->

        <div class="wrapper">
            <div class="container-fluid">
