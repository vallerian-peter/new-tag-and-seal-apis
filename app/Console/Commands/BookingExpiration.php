<?php

namespace App\Console\Commands;

use App\Models\Core\Booking;
use App\Models\Core\Passenger;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class BookingExpiration extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:booking-expiration';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check all pending booking after 10 minutes then mark EXPIRED';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        DB::beginTransaction();

        $bookings = Booking::where('booking_status_id', 7)->get();
        for ($i = 0; $i < count($bookings); $i++) {

            //check booking time
            $booking_time = Carbon::parse($bookings[$i]['created_at']);
            $now = Carbon::now();

            $minutes = $now->diffInMinutes($booking_time);
            if ($minutes <= 0) {
                continue;
            }

            //update booking
            $update = $bookings[$i]->update(['booking_status_id' => 9, 'updated_at' => Carbon::now()]);
            if (!$update) {
                DB::rollBack();
            }

            //get booking passengers
            $passengers = Passenger::where(['booking_id' => $bookings[$i]['id'], 'passenger_status_id' => 7])->get();
            for ($d = 0; $d < count($passengers); $d++) {
                //update passengers
                $update = $passengers[$i]->update(['passenger_status_id' => 9, 'updated_at' => Carbon::now()]);
                if (!$update) {
                    DB::rollBack();
                }
            }
        }

        DB::commit();
    }
}
