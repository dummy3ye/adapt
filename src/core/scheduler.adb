with Ada.Real_Time; use Ada.Real_Time;
with Core.Flight_State; use Core.Flight_State;
with HAL.GPS; use HAL.GPS;
with Safety.Boundaries; use Safety.Boundaries;
with Ada.Text_IO; use Ada.Text_IO;

package body Core.Scheduler is

   task body Flight_Heartbeat is
      Next_Period : Time := Clock;
      Period      : constant Time_Span := Milliseconds(20); -- 50Hz update rate
   begin
      accept Start;
      
      loop
         select
            accept Stop;
            exit;
         else
            -- 1. Perform Flight Logic (Read Sensors, Update Flight_State)
            declare
               GPS_Data : HAL.GPS.GPS_Data := Read_GPS;
               Sensor_Data : Flight_Data := (Alt => GPS_Data.Altitude, X => 0, Y => 0); -- Stub X/Y
            begin
               Update_State(Sensor_Data);
               -- HITL: Print current state for monitoring
               declare
                  Current : Flight_Data := Get_State;
               begin
                  Put_Line("Flight State: Alt=" & Current.Alt'Image & ", X=" & Current.X'Image & ", Y=" & Current.Y'Image);
               end;
            end;
            
            -- 2. Synchronize with the Real-Time Clock
            Next_Period := Next_Period + Period;
            delay until Next_Period;
         end select;
      end loop;
   end Flight_Heartbeat;

end Core.Scheduler;