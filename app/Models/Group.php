<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use DB;
use App\Models\UserMaster;
class Group extends Model
{
    protected $table = 'groups';
    protected $primaryKey = 'id';

    protected $fillable = [  'id', 'orgId', 'groupType_id', 'name', 'description', 'notes', 'image_path', 'meeting_schedule', 'isPublic',
        'location', 'is_enroll_autoClose', 'enroll_autoClose_on', 'is_enroll_autoClose_count', 'enroll_autoClose_count',
        'is_enroll_notify_count', 'enroll_notify_count', 'contact_email', 'visible_leaders_fields',
        'visible_members_fields', 'can_leaders_search_people', 'can_leaders_take_attendance', 'is_event_remind', 'event_remind_before',
        'enroll_status', 'enroll_msg', 'leader_visibility_publicly', 'is_event_public', 'created_at', 'updated_at', 'deleted_at'];



    public function groupType(){
        return $this->belongsTo('App\Models\GroupType', 'groupType_id');
    }

    public function events(){
        return $this->hasMany('App\Models\GroupEvent');
    }

    public function enrolls(){
        return $this->hasMany('App\Models\GroupEnroll');
    }

    public function members(){
        return $this->hasMany('App\Models\GroupMember');
    }

    public function resources(){
        return $this->hasMany('App\Models\GroupResource');
    }

    public function tags(){
        return $this->belongsToMany('App\Models\Tag');
    }


    public static function getGroups($search){
        $result = self::select(DB::raw('SQL_CALC_FOUND_ROWS  id'), 'name', 'description','created_at')
        /* ->orderBy("created_at","desc") */;
        if ($search != "") {
            $result->where(function($query)use($search) {



                return $query->where('p_title', 'name', "%$search%")
                                ->orWhere('description', 'LIKE', "%$search%");

                //echo date("d m y",(int)$search);
            });
        }


        $result->where('orgId', '=', Auth::user()->orgId);

        return $result;
    }

    public static function getGroupDetails($id){
        $groupDetails = self::select('groups.id', 'groups.orgId', 'groups.groupType_id', 'groups.name', 'groups.description', 'groups.notes', 'groups.image_path', 'groups.meeting_schedule', 'groups.isPublic')
                            ->addSelect("group_types.name as group_type_name")
                            ->addSelect("groups.location",'groups.is_enroll_autoClose','groups.enroll_autoClose_on','groups.is_enroll_autoClose_count','groups.enroll_autoClose_count','groups.is_enroll_notify_count')
                            ->addSelect("groups.enroll_notify_count","groups.contact_email","groups.visible_leaders_fields","groups.visible_members_fields")
                            ->join("group_types","group_types.id","=","groups.groupType_id")
                        ->where("groups.id",$id)
                        ->where('groups.orgId', '=', Auth::user()->orgId)
                        ->first();
        return $groupDetails;
    }

    public static function getOverViewDetails($id,$groupType_id){
        $result = array();
        $groupMemebrCount =  GroupMember::select(DB::raw("count(id) as member_count"))
                            ->where("group_id",$id)
                            ->first();
        $groupEventCount =  GroupEvent::select(DB::raw("count(id) as event_count"))
                            ->where("group_id",$id)
                            ->first();


        $otherGroupMemebrCount =  GroupMember::select(DB::raw("count(group_members.id) as member_count"))
                            ->join("groups","groups.id","=","group_members.group_id")
                            ->where("groups.id","<>",$id)
                            ->where("groupType_id",$groupType_id)
                            ->first();

        $otherGroupEventCount =  GroupEvent::select(DB::raw("count(group_events.id) as event_count"))
                                ->join("groups","groups.id","=","group_events.group_id")
                                ->where("groups.id","<>",$id)
                                ->where("groupType_id",$groupType_id)
                                ->first();

        $result["member_count"] = $groupMemebrCount->member_count;
        $result["event_count"] = $groupEventCount->event_count;
        $result["turn_over"] = 0;
        $result["other_group_member_count"] = $otherGroupMemebrCount->member_count;
        $result["other_group_event_count"] = $otherGroupEventCount->event_count;
        $result["other_turn_over"] = 0;

        //echo $groupType_id;



       // print_r($result); exit();

        return $result;
    }


    public static function getUserListForAutocomplete($search, $groupId = "") {
        $user = UserMaster::select('users.id', 'users.first_name', 'users.last_name')
                ->addSelect("group_members.id as group_members_id")
                ->leftJoin("group_members", "group_members.user_id", '=', "users.id")
                ->where(function($query)use($search) {
                    /** @var $query Illuminate\Database\Query\Builder  */
                    return $query->where('users.first_name', 'LIKE', '%' . $search . '%')
                            ->orWhere('users.last_name', 'LIKE', '%' . $search . '%');
                })
                 ->where('users.orgId', '=', Auth::user()->orgId)
                  ->groupBy("group_members.user_id")
                ->get();
        return $user;
    }
}
