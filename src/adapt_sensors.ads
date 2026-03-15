package Adapt_Sensors is
   -- Constraint: Altitude is 0 to 1000m, X/Y are -500 to 500m
   subtype Altitude_Type is Integer range 0 .. 1000;
   subtype Coord_Type    is Integer range -500 .. 500;

   type Sensor_Data is record
      Alt : Altitude_Type;
      X   : Coord_Type;
      Y   : Coord_Type;
   end record;
end Adapt_Sensors;