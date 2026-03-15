with Safety.Boundaries; use Safety.Boundaries;

package Core.Flight_State is

   -- The "Kernel Memory" for Flight.
   -- Ensures thread-safe access to telemetry and position data.
   protected Flight_State is
      -- API for reading telemetry data
      function Get_State return Flight_Data;
      
      -- API for updating position/altitude
      procedure Update_State(New_Data : Flight_Data);
      
      -- API for emergency recovery
      procedure Initiate_Safe_Mode;
      
   private
      Current_State : Flight_Data := (Alt => 0, X => 0, Y => 0);
      System_Critical : Boolean := False;
   end Flight_State;

end Core.Flight_State;