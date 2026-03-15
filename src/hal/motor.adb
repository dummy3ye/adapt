package body HAL.Motor is

   procedure Set_Motor_FL(PWM : PWM_Value) is
   begin
      -- Stub: no hardware control
      null;
   end Set_Motor_FL;

   procedure Set_Motor_FR(PWM : PWM_Value) is
   begin
      -- Stub: no hardware control
      null;
   end Set_Motor_FR;

   procedure Set_Motor_RL(PWM : PWM_Value) is
   begin
      -- Stub: no hardware control
      null;
   end Set_Motor_RL;

   procedure Set_Motor_RR(PWM : PWM_Value) is
   begin
      -- Stub: no hardware control
      null;
   end Set_Motor_RR;

   procedure Set_All_Motors(PWM : PWM_Value) is
   begin
      Set_Motor_FL(PWM);
      Set_Motor_FR(PWM);
      Set_Motor_RL(PWM);
      Set_Motor_RR(PWM);
   end Set_All_Motors;

   procedure Initialize is
   begin
      -- Stub: no hardware initialization
      null;
   end Initialize;

end HAL.Motor;