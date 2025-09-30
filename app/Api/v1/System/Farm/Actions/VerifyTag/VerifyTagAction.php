<?php

namespace App\Api\v1\System\Farm\Actions\VerifyTag;

use App\Models\Livestock;
use App\Models\LivestockTag;
use App\Models\ScanLog;
use App\Models\Tag;
use Illuminate\Http\Request;

class VerifyTagAction
{
    public static function handle(Request $request)
    {
        try {

            //check tag
            $tagExists = Tag::where(['tag_number' => $request->tagNo])
                ->join('tag_types', 'tag_types.id', '=', 'tags.tag_type_id')
                ->join('tag_statuses', 'tag_statuses.id', '=', 'tags.tag_status_id')
                ->select('tags.id', 'tags.tag_number', 'tags.tag_type_id', 'tag_types.name as tag_type', 'tag_statuses.name as tag_status', 'tags.tag_status_id')
                ->get();
            if (count($tagExists) <= 0) {
                $response = "Tag not found.";
                self::saveScanLog($request, $request->tagNo, $response);
                return ['status' => false, 'code' => 100, 'message' => $response, 'data' => []];
            }
            $livestock = Livestock::join('farm_livestocks','livestocks.id','=','farm_livestocks.livestock_id')
                ->select('livestocks.*')
                ->where('farm_livestocks.farm_id',$request->farmId)->first();
            //check tag allocation farm
            $farmTag = LivestockTag::where(['livestock_id' => $livestock->id, 'tag_id' => $tagExists[0]['id']])->get();
            if (count($farmTag) <= 0) {
                $response = "Tag not assigned to this livestock.";
                self::saveScanLog($request, $request->tagNo, $response);
                return ['status' => false, 'code' => 100, 'message' => $response, 'data' => []];
            }

            //check tag status
            // if (!in_array($tagExists[0]['tag_status_id' [4])) {
            //     $response = "Tag already assigned to livestock.";
            //     $this->saveScanLog($request, $request->tag_no, $response, $officer);
            //     return ['status' => false, 'code' => 100, 'message' => $response, 'data' => []];
            // }

            $response = "Tag successfully verified.";
            self::saveScanLog($request, $request->tagNo, $response);

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

    private static function saveScanLog($request, $tag, $response)
    {
        return ScanLog::create([
            'farm_id' => $request->farm_id,
            'tag_no' => $tag,
            'scanned_date' => date('Y-m-d'),
            'scanned_time' => date('H:i:s'),
            'scanned_by' => $request->user()->id,
            'scan_response' => $response
        ]);
    }
}
