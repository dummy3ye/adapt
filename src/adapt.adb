with Ada.Text_IO; use Ada.Text_IO;
with Core.Scheduler; use Core.Scheduler;
with Core.Flight_State; use Core.Flight_State;
with HAL.IMU; use HAL.IMU;
with HAL.GPS; use HAL.GPS;
with HAL.Motor; use HAL.Motor;

procedure Main is
begin
   Put_Line("Adapt Flight Kernel Booting...");
   
   -- 1. Initialize hardware drivers (HAL) here
   Put_Line("HAL: Initializing sensors and motors...");
   HAL.IMU.Initialize;
   HAL.GPS.Initialize;
   HAL.Motor.Initialize;
   
   -- 2. Kick off the Heartbeat
   Put_Line("Kernel: Starting flight scheduler...");
   Flight_Heartbeat.Start;
   
   -- 3. The Main task enters a safe "Monitoring" state
   -- The kernel is now running, and we monitor for system-wide failures.
   loop
      delay 1.0; -- Keep the CPU alive for kernel maintenance
   end loop;
   
exception
   when E : others =>
      Put_Line("CRITICAL: Kernel Panic");
      Flight_State.Initiate_Safe_Mode;
end Main;