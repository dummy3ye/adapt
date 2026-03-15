package body Safety.Boundaries is

   function Is_Safe(Data : Flight_Data) return Boolean is
   begin
      return Data.Alt in Safe_Altitude_Min .. Safe_Altitude_Max and
             Data.X in Safe_Coord_Min .. Safe_Coord_Max and
             Data.Y in Safe_Coord_Min .. Safe_Coord_Max;
   end Is_Safe;

   procedure Clamp_To_Safe(Data : in out Flight_Data) is
   begin
      if Data.Alt < Safe_Altitude_Min then
         Data.Alt := Safe_Altitude_Min;
      elsif Data.Alt > Safe_Altitude_Max then
         Data.Alt := Safe_Altitude_Max;
      end if;

      if Data.X < Safe_Coord_Min then
         Data.X := Safe_Coord_Min;
      elsif Data.X > Safe_Coord_Max then
         Data.X := Safe_Coord_Max;
      end if;

      if Data.Y < Safe_Coord_Min then
         Data.Y := Safe_Coord_Min;
      elsif Data.Y > Safe_Coord_Max then
         Data.Y := Safe_Coord_Max;
      end if;
   end Clamp_To_Safe;

end Safety.Boundaries;