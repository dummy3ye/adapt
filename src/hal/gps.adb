package body HAL.GPS is

   Altitude_Counter : Integer := 0;

   function Read_GPS return GPS_Data is
   begin
      -- Simulate takeoff: increase altitude for first 100 readings, then descend
      if Altitude_Counter < 50 then
         Altitude_Counter := Altitude_Counter + 1;
      elsif Altitude_Counter < 100 then
         Altitude_Counter := Altitude_Counter - 1;
      end if;
      
      return (Latitude => 37.7749, Longitude => -122.4194, Altitude => Altitude_Type(Altitude_Counter * 2), 
              Speed => 0.0, Heading => 0.0);
   end Read_GPS;

   procedure Initialize is
   begin
      -- Stub: no hardware initialization
      null;
   end Initialize;

end HAL.GPS;