with Safety.Boundaries; use Safety.Boundaries;

package body Core.Flight_State is

   protected body Flight_State is

      function Get_State return Flight_Data is
      begin
         return Current_State;
      end Get_State;

      procedure Update_State(New_Data : Flight_Data) is
         Safe_Data : Flight_Data := New_Data;
      begin
         -- Clamp to safe ranges
         Clamp_To_Safe(Safe_Data);

         -- Check if data is safe
         if Is_Safe(Safe_Data) then
            Current_State := Safe_Data;
         else
            -- If not safe, initiate safe mode
            Initiate_Safe_Mode;
         end if;
      end Update_State;

      procedure Initiate_Safe_Mode is
      begin
         System_Critical := True;
         -- In safe mode, set to minimum safe altitude and center coordinates
         Current_State := (Alt => Safe_Altitude_Min, X => 0, Y => 0);
      end Initiate_Safe_Mode;

   end Flight_State;

end Core.Flight_State;