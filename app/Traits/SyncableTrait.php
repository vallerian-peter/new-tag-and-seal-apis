<?php

namespace App\Traits;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;
use Carbon\Carbon;

trait SyncableTrait
{
    use SoftDeletes;

    /**
     * Boot the trait and set up model events
     */
    protected static function bootSyncableTrait()
    {
        // Generate UUID when creating new records (only if not provided by client)
        static::creating(function ($model) {
            // UUID should come from client (Flutter app)
            // Only set if not provided (fallback for server-created records)
            if (empty($model->uuid)) {
                $model->uuid = Str::uuid()->toString();
            }

            // Set original created timestamp
            if (empty($model->original_created_at)) {
                $model->original_created_at = now();
            }

            // Set last modified timestamp
            $model->last_modified_at = now();

            // Set sync status - if from client, likely 'pending', if server-created, 'synced'
            if (empty($model->sync_status)) {
                // If UUID was provided by client, assume it's pending sync
                // If UUID was generated here, mark as synced (server-created)
                $model->sync_status = request()->has('uuid') ? 'pending' : 'synced';
            }
        });

        // Update last modified timestamp when updating
        static::updating(function ($model) {
            $model->last_modified_at = now();

            // Mark as pending sync if not already synced
            if ($model->sync_status === 'synced') {
                $model->sync_status = 'pending';
            }
        });

        // Mark as deleted in sync status when soft deleting
        static::deleting(function ($model) {
            $model->last_modified_at = now();
            $model->sync_status = 'deleted';
            $model->save(); // Save before soft delete
        });
    }

    /**
     * Scope to get records that need syncing
     */
    public function scopeNeedsSync($query)
    {
        return $query->whereIn('sync_status', ['pending', 'conflict']);
    }

    /**
     * Scope to get records modified after a specific timestamp
     */
    public function scopeModifiedAfter($query, $timestamp)
    {
        return $query->where('last_modified_at', '>', $timestamp);
    }

    /**
     * Scope to get records by device ID
     */
    public function scopeByDevice($query, $deviceId)
    {
        return $query->where('device_id', $deviceId);
    }

    /**
     * Mark record as synced
     */
    public function markAsSynced()
    {
        $this->sync_status = 'synced';
        $this->save();
    }

    /**
     * Mark record as having conflict
     */
    public function markAsConflicted()
    {
        $this->sync_status = 'conflict';
        $this->save();
    }

    /**
     * Set device ID for the record
     */
    public function setDeviceId($deviceId)
    {
        $this->device_id = $deviceId;
        $this->save();
    }

    /**
     * Check if record has conflicts with another record
     */
    public function hasConflictWith($otherRecord)
    {
        // Compare timestamps - if this record is newer, no conflict
        if ($this->last_modified_at > $otherRecord->last_modified_at) {
            return false;
        }

        // Check if significant fields are different
        return $this->getSignificantFields() !== $otherRecord->getSignificantFields();
    }

    /**
     * Get significant fields for conflict detection
     * Override this method in individual models
     */
    protected function getSignificantFields()
    {
        $excludeFields = [
            'id', 'uuid', 'created_at', 'updated_at', 'last_modified_at',
            'sync_status', 'device_id', 'original_created_at', 'deleted_at'
        ];

        return collect($this->getAttributes())
            ->except($excludeFields)
            ->toArray();
    }

    /**
     * Resolve conflict using last-write-wins strategy
     */
    public function resolveConflictWith($otherRecord, $strategy = 'last_write_wins')
    {
        switch ($strategy) {
            case 'last_write_wins':
                return $this->last_modified_at >= $otherRecord->last_modified_at ? $this : $otherRecord;

            case 'server_wins':
                return $otherRecord;

            case 'client_wins':
                return $this;

            default:
                return $this->last_modified_at >= $otherRecord->last_modified_at ? $this : $otherRecord;
        }
    }

    /**
     * Create sync payload for API transmission
     */
    public function toSyncPayload()
    {
        $payload = $this->toArray();

        // Ensure UUID is present
        if (empty($payload['uuid'])) {
            $payload['uuid'] = Str::uuid()->toString();
            $this->uuid = $payload['uuid'];
            $this->save();
        }

        return $payload;
    }

    /**
     * Update from sync payload with conflict resolution
     */
    public function updateFromSyncPayload(array $payload, $deviceId = null)
    {
        // If this is a new record or incoming record is newer, update
        $incomingTimestamp = Carbon::parse($payload['last_modified_at'] ?? now());

        if (!$this->exists || $incomingTimestamp > $this->last_modified_at) {
            $this->fill($payload);
            $this->last_modified_at = $incomingTimestamp;
            $this->sync_status = 'synced';

            if ($deviceId) {
                $this->device_id = $deviceId;
            }

            $this->save();
            return true;
        }

        // Mark as conflict if local record is newer
        $this->markAsConflicted();
        return false;
    }

    /**
     * Get records that have conflicts
     */
    public static function getConflictedRecords()
    {
        return static::where('sync_status', 'conflict')->get();
    }

    /**
     * Get sync metadata for a record
     */
    public function getSyncMetadata()
    {
        return [
            'uuid' => $this->uuid,
            'last_modified_at' => $this->last_modified_at,
            'sync_status' => $this->sync_status,
            'device_id' => $this->device_id,
            'original_created_at' => $this->original_created_at,
            'has_conflicts' => $this->sync_status === 'conflict'
        ];
    }
}
