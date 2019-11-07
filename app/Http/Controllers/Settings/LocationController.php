<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Location;
use DB;
use Config;
use App\Models\Resources;
use App\Models\Roles;
use Illuminate\Http\Response;
use DataTables;
use Auth;

class LocationController extends Controller {

    public function __construct() {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->common_file_upload_path = Config::get('constants.FILE_UPLOAD_PATH');
        $this->common_file_download_path = Config::get('constants.FILE_DOWNLOAD_PATH');
    }

    public function index() {

        $data['title'] = $this->browserTitle . " - Location Management";

        return view('Settings.location.index', $data);
    }

    public function list(Request $request){
        $locations = Location::listLocations($request->search['value']);

        return DataTables::of($locations)
                        ->addColumn('action', function($row) {
                            $btn = '<a onclick="editLocation(' . $row->id . ')"  class="edit btn btn-primary btn-sm ">Edit</a>';


                            return $btn;
                        })


                        ->rawColumns(['action','image'])
                        ->make(true);
    }

    public function addPage(Request $request){
        $data['title'] = $this->browserTitle . " - Location Management";

        return view('Settings.location.create', $data);
    }


}