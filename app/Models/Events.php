<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;
use DateTime;
use Auth;

class Events extends Model {

    /**
     * The database table used by the model.
     *
     * @var string
     */
    use SoftDeletes;

    protected $table = 'events';
    protected $primaryKey = 'eventId';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['eventId', 'orgId', 'eventName', 'eventDesc', 'eventFreq', 'eventCreatedDate', 'eventCheckin', 'eventShowTime', 'eventStartCheckin', 'eventEndCheckin', 'eventLocation', 'eventRoom','createdBy', 'created_at', 'updatedBy', 'updated_at', 'deletedBy', 'deleted_at'];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['created_at', 'updated_at', 'deleted_at'];

    public static function listEvents($search, $date) {
        $result = self::select('eventId', 'eventName', 'eventDesc', 'eventFreq', 'eventCreatedDate', 'eventCheckin', 'eventStartCheckin', 'eventEndCheckin', 'eventLocation')
        /* ->orderBy("created_at","desc") */;
        if ($search != "") {
            $result->where(function($query)use($search) {



                return $query->where('eventName', 'LIKE', "%$search%")
                                ->orWhere('eventDesc', 'LIKE', "%$search%");

                //echo date("d m y",(int)$search);
            });
        }

        if ($date != "") {

            //echo date("Y:m:d",strtotime($search));
            $result->whereDate('eventCreatedDate', date("Y:m:d", strtotime($date)));
        }
        $result->where('orgId', '=', Auth::user()->orgId);

        return $result;
    }

    public static function getEventsDetails($eventId) {
        $result = self::select('eventId', 'eventName', 'eventDesc', 'eventFreq', 'eventCreatedDate', 'eventCheckin', 'eventStartCheckin', 'eventEndCheckin', 'eventLocation')
                ->where("eventId", $eventId)
                ->first();

        return $result;
    }

    private static function validateDate($date, $format = 'Y-m-d') {
        $d = DateTime::createFromFormat($format, $date);
        return $d && $d->format($format) === $date;
    }

    // Created By Lokesh 19-09-2019
    public function schedules()
    {
        return $this->hasMany('App\Models\Schedule', 'event_id', 'eventId');
    }

}
