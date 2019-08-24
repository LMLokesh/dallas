<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Config;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Redirect;
use App\Lookup;
use App\User;
use App\Household;
use App\HouseholdDetail;
use App\Helpers\CommunicationHelper;
use DB;

class MemberController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
    }

    /*
    ** Purpose: Create a new member or edit a member if id present
    */
    public function createOrEdit($personal_id = null) {
        $orgId = $this->userSessionData['umOrgId'];
        $keys = ["school_name", "name_prefix", "name_suffix", "marital_status", "grade_name"];
        $keys1 = ["school_name", "name_prefix", "name_suffix", "marital_status", "grade_id"];

        

        if($personal_id){
            $user = User::where('orgId', $orgId)->where("personal_id", $personal_id)->first();
            if($user){
                $fullAdr = explode("///",$user['address']);
                $user['street_address'] = $fullAdr[0];
                $user['apt_address'] = isset($fullAdr[1])? $fullAdr[1]:'';
                $user['city_address'] = isset($fullAdr[2])? $fullAdr[2]:'';
                $user['state_address'] = isset($fullAdr[3])? $fullAdr[3]:'';
                $user['zip_address'] = isset($fullAdr[4])? $fullAdr[4]:'';
                $data['user'] = $user;
            } else {
                return redirect('people/member/management');
            }
            $data['title'] = $this->browserTitle . " - Member Edit";
        } else {
            $data['title'] = $this->browserTitle . " - Member Create";
        }
        $lookupData = Lookup::memberQueryData($orgId, $keys);
        foreach($keys1 as $key){
            $data[$key] = $lookupData[$key];
        }

        $data['rolesData'] = DB::table('roles')->where('orgId',$this->userSessionData['umOrgId'])->where('role_tag','!=','admin')->get();

        return view('members.member_create', $data);
    }

    public function storeOrUpdate(Request $request, $personal_id=null){
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|Regex:/^([a-zA-Z0-9]+[a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,})$/',
            ]);
        if ($validator->passes()) {
            $user = null;
            if($personal_id){
                $user = User::where('personal_id', $personal_id)->first();
            }else {
                $user = new User();
                $user['orgId'] = $this->userSessionData['umOrgId'];
                $user['referal_code'] = substr($request->first_name, 0, 4) .strtolower(str_random(4));
                $count = User::count();
                $user['personal_id'] = str_pad($count + 1, 10, "0", STR_PAD_LEFT);
                $user['password'] = "password";
                $request[''] = 2;
            }
            $user['address'] = $request->street_address."///".$request->apt_address."///".$request->city_address."///".$request->state_address."///".$request->zip_address;
            $user['householdName'] = $request->first_name."'s household";

            $keys= ['name_prefix', 'first_name','middle_name', 'last_name', 'name_suffix', 'given_name', 'nick_name',
                     'email', 'mobile_no', 'life_stage', 'gender', 'dob', 'marital_status', 'doa', 'school_name', 
                     'grade_id', 'medical_note', 'social_profile'
                ];
            foreach($keys as $key){
                $user[$key] = $request[$key];
            }
            $user['full_name'] = $this->extractFullName($user);
            $user->save();

            $rolesAdminData = DB::table('roles')->where('orgId',$this->userSessionData['umOrgId'])->where('role_tag','member')->get();

            $roles = $request->input('roles') ? $request->input('roles') : [$rolesAdminData[0]->id];
            if($personal_id){
                $user->syncRoles($roles);    
            }else{
                $user->assignRole($roles);
            }
            
            
            
            // $rolesAdminData = DB::table('roles')->where('orgId',$this->userSessionData['umOrgId'])->where('role_tag','member')->get();
            // //insert into model_has_roles with admin role
            // DB::table('model_has_roles')->insert(array('role_id'=>$rolesAdminData[0]->id,'model_type'=>'App\User','model_id'=>$user->id));
            
            if($personal_id){
                Session::flash('message', 'Member profile has been updated successfully');
            } else {
                $userIds = [$user->id];
                $this->generateCommunication('welcome', 1, $userIds);
                Session::flash('message', 'Member profile has been created successfully');
            }
           
            return redirect('people/member/'.$user->personal_id);
        } else {
            return Redirect::back()
                            ->withInput($request->except('password'))
                            ->withErrors($validator);
        }
    }

    public function viewMember($personal_id){
        $orgId = $this->userSessionData['umOrgId'];
        $user = User::where('orgId', $orgId)->where("personal_id", $personal_id)->first();
        $fullAdr = explode("///",$user['address']);
        $user['address'] = $fullAdr[0];
        $user['address'] .= isSet($fullAdr[1]) && strlen($fullAdr[1]) >0? ','. $fullAdr[1]:'';
        $user['address'] .= isSet($fullAdr[2]) && strlen($fullAdr[2]) >0? ','. $fullAdr[2]:'';
        $user['address'] .= isSet($fullAdr[3]) && strlen($fullAdr[3]) >0? ','. $fullAdr[3]:'';
        $user['address'] .= isSet($fullAdr[4]) && strlen($fullAdr[4]) >0? '-'. $fullAdr[4]:'';
        // Getting Master loook data
        $keys = ["school_name", "name_prefix", "name_suffix", "marital_status"];
        $lookUpKeys = [];
        foreach($keys as $key){
            if(isSet($user[$key])){
                $lookUpKeys[] = $user[$key];
            }
        }
        if(isSet($user["grade_id"])){
            $lookUpKeys[] = $user["grade_id"];
        }

        $lookUpData = Lookup::whereIn('mldId', $lookUpKeys)->select('mldKey', 'mldValue')->get();
        $keys[] = 'grade_name';
        foreach($lookUpData as $lookupRow){
            foreach($keys as $key){
                if($lookupRow['mldKey'] == $key){
                    $user[$key] = $lookupRow['mldValue'];
                }
            }
        }
        $data['title'] = $this->browserTitle . " - Member View";
        
        $data['user'] = $user;

        return view('members.member_view', $data);
    }

    public function getHouseholderList($personal_id){
        $mainUser = User::where('personal_id', $personal_id)->first();
        $households = [];
        $i = 0;
        foreach($mainUser->households as $hh){
            $households[$i]['id'] = $hh->id;
            $households[$i]['name'] = $hh->name;
            $j = 0;
            foreach($hh->users as $huser){
                $user = $this->extreactHhUrserFields($huser);
                $user['address'] = $this->extractAddress($huser);
                $households[$i]['users'][] = $user;
            }
             $i++;
        }
        return $households;
    }

    public function getHhUserSearch(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $orgId = $this->userSessionData['umOrgId'];
        // dd($payload['exceptIds']);
        $users = User::whereNotIn("id", $payload['exceptIds'])
                    ->where('orgId', $orgId)
                    ->where('full_name', 'LIKE', "%" . $payload['searchStr'] . "%")
                    ->orWhere("email", $payload['searchStr'])
                    ->orWhere("mobile_no",$payload['searchStr'])
                    ->select('id', "full_name","mobile_no", 'email', 'personal_id', 'profile_pic', 'address')
                    ->get();
        foreach($users as $user){
            $user["address"] = $this->extractAddress($user);
        }
        
        return $users; 
    }

    public function createNewHousehold(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $orgId = $this->userSessionData['umOrgId'];

        $newHousehold = Household::create([
                            'name' => $payload['hhName'],
                            'orgId' => $orgId,
                            'hhPrimaryUserId' => $payload['primary_user']
                        ]);
        
        // Generating Comm for household_added with relative users
        $this->generateCommunication('household_added', 2, [$payload['primary_user'], $payload['user']]);
        $newHousehold->users()->attach([
            $payload['primary_user'] => ['isPrimary' => 1],
            $payload['user'] => ['isPrimary' => 2]
        ]);

        $newHh['id'] = $newHousehold->id;
        $newHh['name'] = $newHousehold->name;
        foreach($newHousehold->users as $huser){
            $user = $this->extreactHhUrserFields($huser);
            $user["address"] = $this->extractAddress($huser);
            $newHh['users'][] = $user;
        }

        return $newHh;
    }

    public function removeHousehold(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $orgId = $this->userSessionData['umOrgId'];

        $household = Household::where('orgId', $orgId)->where('id', $payload["hhId"])->first();
        $household->users()->detach();
        $household->delete();
        $data = ["msg"=>"Househose has been successfully removed from db"];
        return $data;
    }

    public function updateHousehold(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $orgId = $this->userSessionData['umOrgId'];
        $payloadData = $payload["household"];

        $household = Household::where('orgId', $orgId)->where('id', $payloadData["id"])->first();
        $existingUsers = $household->users;
        $household->users()->detach();
        $household->name = $payloadData["name"];
        $household->save();

        $existingUserIds = [];
        foreach($existingUsers as $euser){
            $existingUserIds[] = $euser['id'];
        }

        $attachUsers = [];
        $userIds = [];
        foreach($payloadData["users"] as $user){
            if(!in_array($user["id"], $existingUserIds)){
                $userIds[] = $user["id"];
            }
            $attachUsers[$user["id"]] = ['isPrimary' => $user["isPrimary"]];
        }

        // Generating Comm for household_added with relative users
        $this->generateCommunication('household_added', 2, $userIds);

        $household->users()->attach($attachUsers);

        $data = ["msg"=>"Househose has been updated successfully from db"];
        return $data;
    }

    public function extractAddress($suser){
        $fullAdr = explode("///",$suser['address']);
        $address = $fullAdr[0];
        $address .= isset($fullAdr[1]) && strlen($fullAdr[1]) > 0 ? ', '. $fullAdr[1] : '';
        $address .= isset($fullAdr[2]) && strlen($fullAdr[2]) > 0 ? ', '. $fullAdr[2] : '';
        $address .= isset($fullAdr[3]) && strlen($fullAdr[3]) > 0 ? ', '. $fullAdr[3] : '';
        $address .= isset($fullAdr[4]) && strlen($fullAdr[4]) > 0 ? ' - '. $fullAdr[4] : '';
        return $address;
    }

    public function extreactHhUrserFields($sUser){
        $user['id'] = $sUser->id;
        $user['full_name'] = $sUser->full_name;
        $user['first_name'] = $sUser->first_name;
        $user['middle_name'] = $sUser->middle_name;
        $user['last_name'] = $sUser->last_name;
        $user['personal_id'] = $sUser->personal_id;
        $user['email'] = $sUser->email;
        $user['mobile_no'] = $sUser->mobile_no;
        $user['profile_pic'] = $sUser->profile_pic;
        $user['isPrimary'] = $sUser->pivot->isPrimary;
        return $user;
    }

    public function generateCommunication($tag, $type, $userIds){
        $orgId = $this->userSessionData['umOrgId'];
        $createdUserId = $this->userSessionData['umId'];
        if(count($userIds) > 0){
            CommunicationHelper::generateCommunications($tag, $orgId, $type, $createdUserId, $userIds);
        }
    }

    public function extractFullName($user){
        $full_name = isset($user["first_name"]) ? $user["first_name"] : '';
        $full_name .= isset($user["middle_name"]) ? ' '. $user["middle_name"] : '';
        $full_name .= isset($user["last_name"]) ? ' '. $user["last_name"] : '';
        return $full_name;
    }
}