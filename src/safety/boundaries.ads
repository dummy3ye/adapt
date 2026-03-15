with Adapt_Sensors; use Adapt_Sensors;

package Safety.Boundaries is

   -- Flight_Data is an alias for Sensor_Data with safety constraints
   subtype Flight_Data is Sensor_Data;

   -- Safe operating ranges (subset of physical limits)
   Safe_Altitude_Min : constant Altitude_Type := 10;
   Safe_Altitude_Max : constant Altitude_Type := 800;
   Safe_Coord_Min    : constant Coord_Type := -400;
   Safe_Coord_Max    : constant Coord_Type := 400;

   -- Emergency thresholds
   Emergency_Altitude_Low  : constant Altitude_Type := 5;
   Emergency_Altitude_High : constant Altitude_Type := 900;

   -- Function to check if data is within safe bounds
   function Is_Safe(Data : Flight_Data) return Boolean;

   -- Procedure to clamp data to safe ranges
   procedure Clamp_To_Safe(Data : in out Flight_Data);

end Safety.Boundaries;