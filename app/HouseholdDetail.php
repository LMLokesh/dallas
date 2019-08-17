<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HouseholdDetail extends Model
{
    /** 
        * The table associated with the model
    */
    protected $table = "household-details";
    protected $primaryKey = 'hhdId';

    protected $fillable = [
        'hhdId', 'hhId', 'hhdUserId', 'hhIsPrimary', 'createdBy', 'created_at', 'updated_at', 'deletedBy', 'deleted_at'
    ];

    public function household(){
        return $this->belongsTo('App\Household', 'hhId');
    }

    public function user(){
        return $this->hasOne('App\User', "personal_id", "hhdUserId");
    }

    public function getHouseholdIds($personal_id){
      return HouseholdDetail::where('hhdUserId', $personal_id)->pluck('hhId');
    }
}
