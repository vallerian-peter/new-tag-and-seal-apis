<?php

namespace App\Api\v1\Core\Auth\Helpers;

use App\Api\v1\Core\Auth\Actions\Login\LoginAction;
use App\Models\ExtensionOfficer;
use App\Models\Farmer;
use App\Models\SystemUser;
use App\Models\User;

class GetUserProfile
{
    public static function init($userId) {
        $user = User::where([
            'id' => $userId
        ])->first();

        if (!$user) {
            return null;
        }

        if ($user->profile == LoginAction::SYSTEM_USER) {
            $record = SystemUser::query()->where(['id' => $user->profile_id])->first();
            return $record;
        } else if($user->profile == LoginAction::FARMER) {
            $record = Farmer::where(['id' => $user->profile_id])->first();

            $record->name = $record->first_name;
            $record->name .= $record->middle_name ? ' ' . $record->middle_name : '';
            $record->name .= ' ' . $record->surname;

            return $record;
        } else if ($user->profile == LoginAction::EXTENSION_OFFICER) {
            return ExtensionOfficer::where(['id' => $user->profile_id])->first();
        }

        return null;
    }
}
