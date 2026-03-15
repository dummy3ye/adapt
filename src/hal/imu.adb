package body HAL.IMU is

   function Read_IMU return IMU_Data is
   begin
      -- Stub implementation: return zero values
      return (Accel_X => 0.0, Accel_Y => 0.0, Accel_Z => -9.81,
              Gyro_X => 0.0, Gyro_Y => 0.0, Gyro_Z => 0.0);
   end Read_IMU;

   procedure Initialize is
   begin
      -- Stub: no hardware initialization
      null;
   end Initialize;

end HAL.IMU;