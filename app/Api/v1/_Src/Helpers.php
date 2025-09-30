<?php

namespace App\Api\v1\_Src;

use App\Models\Attachment;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Storage;

class Helpers
{
    public static function saveAttachment($files, $attachmentType)
    {
//        $attachment_types = [1];

        $data = [];
        if (!is_null($files) && $files != 'null') {
            for ($i = 0; $i < count($files); $i++) {
                $fileName = hrtime()[1] . '.' . $files[$i]->extension();
                $fileSize = $files[$i]->getSize();

                $filePath = 'uploads/' . $fileName;

                Storage::disk('attachments')->put($filePath, file_get_contents($files[$i]));
                $path = Storage::url($fileName);

                $saveAttachment = Attachment::create([
                    'name' => $fileName,
                    'path' => $path,
                    'size' => $fileSize,
                    'attachment_type_id' => $attachmentType,
                    'created_at' =>  Carbon::now(),
                ]);

                if (!$saveAttachment) {
                    return ['status' => false, 'message' => 'Failed to create attachment.'];
                }

                $data[] = $saveAttachment;
            }
        }
        return ['status' => true, 'message' => 'Attachment uploaded successfully.', 'data' => $data];
    }
}
