with Adapt_Sensors; use Adapt_Sensors;

package HAL.IMU is

   -- Interface for Inertial Measurement Unit
   -- Provides acceleration and orientation data

   type IMU_Data is record
      Accel_X : Float;  -- m/s²
      Accel_Y : Float;
      Accel_Z : Float;
      Gyro_X  : Float;  -- rad/s
      Gyro_Y  : Float;
      Gyro_Z  : Float;
   end record;

   -- Read current IMU data
   function Read_IMU return IMU_Data;

   -- Initialize IMU hardware
   procedure Initialize;

end HAL.IMU;