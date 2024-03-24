SELECT taxi_id, trip_start_timestamp, tips
FROM {{ source('chicago_taxi_trips', 'taxi_trips') }}