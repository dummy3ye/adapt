package HAL.Motor is

   -- Interface for Motor PWM control
   -- Controls motor speeds via PWM signals

   type PWM_Value is range 0 .. 1000;  -- 0 to 100% duty cycle scaled

   -- Set PWM for individual motors (assuming quadcopter: front-left, front-right, rear-left, rear-right)
   procedure Set_Motor_FL(PWM : PWM_Value);
   procedure Set_Motor_FR(PWM : PWM_Value);
   procedure Set_Motor_RL(PWM : PWM_Value);
   procedure Set_Motor_RR(PWM : PWM_Value);

   -- Set all motors to same PWM
   procedure Set_All_Motors(PWM : PWM_Value);

   -- Initialize motor PWM hardware
   procedure Initialize;

end HAL.Motor;