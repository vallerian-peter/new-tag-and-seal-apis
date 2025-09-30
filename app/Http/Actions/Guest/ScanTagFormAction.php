<?php

namespace App\Http\Actions\Guest;

use App\Api\v1\Core\Auth\Actions\Login\LoginAction;
use App\Models\LivestockTag;
use App\Models\ScanLog;
use App\Models\Tag;
use App\Models\TagStatus;
use App\Models\User;
use Illuminate\Http\Request;

class ScanTagFormAction
{
    public function handle(Request $request)
    {
        //check tag
        $tagExists = Tag::where(['tag_number' => $request->tagNumber])->first();
        if (!$tagExists) {
            $response = "Tag doesn't exist.";
            $this->saveScanLog($request->tagNumber, $response);
            return ['status' => false,'code' => 404, 'message' => $response, 'data' => []];
        }

        //check tag status
        if (!in_array($tagExists['tag_status_id'], [TagStatus::ASSIGNED])) {
            $response = "Tag not assigned to livestock.";
            $this->saveScanLog($request->tagNumber, $response);
            return ['status' => true, 'code' => 200, 'message' => $response, 'data' => []];
        }

        $response = "Success.";
        $this->saveScanLog($request->tagNumber, $response);

        $livestockDetails = $this->getLivestockDetails($request->tagNumber);
        if (count($livestockDetails) <= 0) {
            return ['status' => false, 'code' => 100, 'message' => $livestockDetails['message'], 'data' => []];
        }

            return ['status' => true, 'code' => 200,'message' => $response, 'data' => $livestockDetails];
    }

    private function saveScanLog($tag, $response)
    {
        return ScanLog::create([
            'tag_no' => $tag,
            'scanned_date' => date('Y-m-d'),
            'scanned_time' => date('H:i:s'),
            'scan_response' => $response
        ]);
    }

    private function getLivestockDetails($tag)
    {
        $tag = Tag::where('tag_number', $tag)->first();
        $livestockTag = LivestockTag::where(['tag_id' => $tag->id, 'state_id' => 1])->first();
        $livestock = $livestockTag->livestock;
        $farmerUser = User::query()->where(['id' => $livestock->created_by, 'profile' => LoginAction::FARMER])->first();

//        $data = [
//            'id' => $livestock->id,
//            'nida' => $livestock->identification_number,
//            'livestock_type' => $livestock->livestockType->name,
//            'name' => $livestock->name ?? '',
//            'gender' => $livestock->gender->name,
//            'date_of_birth' => $livestock->date_of_birth,
//            'mother' => $livestock->farm->farm->mother ?? '-',
//            'father' => $livestock->farm->farm->father ?? '-',
//            'breed' => $livestock->breed->name,
//            'species' => $livestock->species->name,
//            'farm' => $livestock->farm->farm->name . '/' . $livestock->farm->farm->regional_reg_no,
//            'region' => $livestock->farm->farm->region->name,
//            'district' => $livestock->farm->farm->district->name,
//        ];

        return [
            'tagDetails' => [
                "id" => $tag->id,
                "number" => $tag->tag_number,
                "type" => $tag->tagType->name,
                "category" => '',
            ],
            'livestockDetails' => [
                "id" => $livestock->id,
                "name" => $livestock->name,
                "farmId" => $livestock->farm->farm->id,
                "farmerId" => $farmerUser->profile_id,
            ],
        ];
    }
}
