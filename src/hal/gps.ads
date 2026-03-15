with Adapt_Sensors; use Adapt_Sensors;

package HAL.GPS is

   -- Interface for GPS module
   -- Provides position data

   type GPS_Data is record
      Latitude  : Float;  -- degrees
      Longitude : Float;
      Altitude  : Altitude_Type;  -- meters
      Speed     : Float;  -- m/s
      Heading   : Float;  -- degrees
   end record;

   -- Read current GPS data
   function Read_GPS return GPS_Data;

   -- Initialize GPS hardware
   procedure Initialize;

end HAL.GPS;