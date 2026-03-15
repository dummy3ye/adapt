package Core.Scheduler is

   -- The Heartbeat Task: Ensures the system frequency is maintained.
   task Flight_Heartbeat is
      entry Start;
      entry Stop;
   end Flight_Heartbeat;

end Core.Scheduler;