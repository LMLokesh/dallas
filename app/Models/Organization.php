<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class Organization extends Model  {



    /**
     * The database table used by the model.
     *
     * @var string
     */
    use SoftDeletes;
    protected $table = 'organization';
    protected $primaryKey = 'orgId';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = [ 'orgId', 'orgName', 'orgAddress', 'orgAptUnitBox', 'orgCity', 'orgState', 'orgPincode', 'orgPhone', 'orgLogo', 'orgTimeZone', 'orgTimeCountry', 'orgTimeFormat', 'orgDateFormat', 'orgCurrency', 'orgEmail', 'orgWebsite', 'orgTaxIdNo', 'orgDomain', 'createdBy', 'created_at', 'updatedBy', 'updated_at', 'deletedBy', 'deleted_at'];

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

    /**
     * @Function name : selectFromOrganization
     * @Purpose : Select from Organization data based on where array
     * @Added by : Biplob
     * @Added Date : Jul 13, 2018
     */
    public static function selectFromOrganization($whereArray) {
        $query = Organization::where($whereArray);
        return $query;
    }

    /**
     * @Function name : updateOrganization
     * @Purpose : Update Organization data based on where array
     * @Added by : Biplob
     * @Added Date : Jul 13, 2018
     */
    public static function updateOrganization($update_details, $whereArray) {
        Organization::where($whereArray)->update($update_details);
    }

    /**
     * @Function name : deleteOrganization
     * @Purpose : delete Organization data based on  where array
     * @Added by : Biplob
     * @Added Date : Jul 13, 2018
     */
    public static function deleteOrganization($whereArray) {
        Organization::where($whereArray)->delete();
    }
     
    
    /**
    * @Function name : crudOrganization
    * @Purpose : crud account heads based on  array
    * @Added by : Sathish
    * @Added Date : Nov 07, 2018
    */
    public static function crudOrganization($whereArray=null,$whereInArray=null,$whereNotInArray=null,$whereNotNullArray=null,$whereNullArray=null,$update_details=null,$delete=null,$select=null) {
        $query = Organization::query();
        if($whereArray){
            $query->where($whereArray);
        }
        if($whereInArray){
            foreach($whereInArray as $key=>$value){
                $whereInFiltered = array_filter($value);
                $query->whereIn($key,$whereInFiltered);
            }
        }
        if($whereNotInArray){
            foreach($whereNotInArray as $key=>$value){
                $whereNotInFiltered = array_filter($value);
                $query->whereNotIn($key,$whereNotInFiltered);
            }
        }
        if($whereNotNullArray){
            foreach($whereNotNullArray as $value){
                $query->whereNotNull($value);
            }            
        }
        if($whereNullArray){
            foreach($whereNullArray as $value){
                $query->whereNull($value);
            }            
        }
        
        if($update_details){
            $query->update($update_details);
        }elseif($delete){
            $query->delete();
        }elseif($select){
            return $query;
        }
    }
}
