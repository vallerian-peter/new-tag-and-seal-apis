<?php

namespace App\Http\Actions\ExtensionOfficer;

use App\Models\ExtensionOfficer;
use App\Models\ExtensionOfficerFarm;
use App\Models\Farm;
use App\Models\Livestock;
use App\Models\LivestockTag;
use App\Models\ScanLog;
use App\Models\Tag;
use Illuminate\Http\Request;

class ExtensionOfficerVerifyTagFormAction
{
    public function handle(Request $request)
    {
        try {

            //get officer
            $officer = ExtensionOfficer::find($request->officer_id);
            $farm = Farm::find($request->farm_id);

            //check if officer assigned to this farm
            $officerFarm = ExtensionOfficerFarm::where(['farm_id' => $farm->id, 'extension_officer_id' => $officer->id, 'state_id' => 1])->get();
            if (count($officerFarm) <= 0) {
                return ['status' => false, 'code' => 100, 'message' => 'You are not belong to this farm', 'data' => []];
            }


            //check tag
            $tagExists = Tag::where(['tag_number' => $request->tag_no])->select('id', 'tag_number', 'tag_type_id', 'tag_status_id')->get();
            if (count($tagExists) <= 0) {
                $response = "Tag not found.";
                $this->saveScanLog($request, $request->tag_no, $response, $officer);
                return ['status' => false, 'code' => 100, 'message' => $response, 'data' => []];
            }
            $livestock = Livestock::join('farm_livestocks','livestocks.id','=','farm_livestocks.livestock_id')
            ->select('livestocks.*')
            ->where('farm_livestocks.farm_id',$request->farm_id)->first();
            //check tag allocation farm
            $farmTag = LivestockTag::where(['livestock_id' => $livestock->id, 'tag_id' => $tagExists[0]['id']])->get();
            if (count($farmTag) <= 0) {
                $response = "Tag not assigned to this livestock.";
                $this->saveScanLog($request, $request->tag_no, $response, $officer);
                return ['status' => false, 'code' => 100, 'message' => $response, 'data' => []];
            }

            //check tag status
            // if (!in_array($tagExists[0]['tag_status_id' [4])) {
            //     $response = "Tag already assigned to livestock.";
            //     $this->saveScanLog($request, $request->tag_no, $response, $officer);
            //     return ['status' => false, 'code' => 100, 'message' => $response, 'data' => []];
            // }

            $response = "Tag successfully verified.";
            $this->saveScanLog($request, $request->tag_no, $response, $officer);

            return ['status' => true, 'code' => 200, 'message' => $response, 'data' => $tagExists[0]];
        } catch (\Exception $ex) {
            return [
                'status' => false,
                'code' => 100,
                'message' => $ex->getMessage(),
                'data' => []
            ];
        }
    }

    private function saveScanLog($request, $tag, $response, $officer)
    {
        return ScanLog::create([
            'farm_id' => $request->farm_id,
            'tag_no' => $tag,
            'scanned_date' => date('Y-m-d'),
            'scanned_time' => date('H:i:s'),
            'scanned_by' => $officer->id,
            'scan_response' => $response
        ]);
    }
}
