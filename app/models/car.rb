require 'pi_piper'
class Car
include PiPiper

#Right side wheels
@f_r_f = PiPiper::Pin.new(:pin => 23, :direction => :out) #IN3
@f_r_b = PiPiper::Pin.new(:pin => 24, :direction => :out) #IN4
@b_r_f = PiPiper::Pin.new(:pin => 20, :direction => :out) #IN1
@b_r_b = PiPiper::Pin.new(:pin => 21, :direction => :out) #IN2

#Left side wheels
@b_l_f = PiPiper::Pin.new(:pin => 27, :direction => :out) #IN3
@b_l_b = PiPiper::Pin.new(:pin => 22, :direction => :out) #IN4
@f_l_f = PiPiper::Pin.new(:pin => 6, :direction => :out) #IN1
@f_l_b = PiPiper::Pin.new(:pin => 5, :direction => :out) #IN2

#Right ENB
@r_pwm_b = PiPiper::Pwm.new pin: 12
#Right ENA
@r_pwm_a = PiPiper::Pwm.new pin: 18

#Left ENB
@l_pwm_b = PiPiper::Pwm.new pin: 19
#Left ENA
@l_pwm_a = PiPiper::Pwm.new pin: 13

@all_wheels = [@f_r_f,@f_r_b,@f_l_f,@f_l_b,@b_r_f,@b_r_b,@b_l_f,@b_l_b]
@pwm = [@r_pwm_a,@r_pwm_b,@l_pwm_a,@l_pwm_b]

#####right side
def self.front_right_forward #右前轮前转
  @f_r_f.on
  @r_pwm_b.value = 0.5
  @r_pwm_b.on
end

def self.front_right_backward #右前轮后转
  @f_r_b.on
  @r_pwm_b.value = 0.5
  @r_pwm_b.on
end

def self.back_right_forward  #右后轮前转
  @b_r_f.on
  @r_pwm_a.value = 0.5
  @r_pwm_a.on
end

def self.back_right_backward #右后轮后转
  @b_r_b.on
  @r_pwm_a.value = 0.5
  @r_pwm_a.on
end

#########left side
def self.front_left_forward #左前轮前转
  @f_l_f.on
  @l_pwm_a.value = 0.5
  @l_pwm_a.on
end

def self.front_left_backward #左前轮后转
  @f_l_b.on
  @l_pwm_b.value = 0.5
  @l_pwm_b.on
end

def self.back_left_forward # 左后轮前转
  @b_l_f.on
  @l_pwm_b.value = 0.5
  @l_pwm_b.on
end

def self.back_left_backward  #左后轮后转
  @b_l_b.on
  @l_pwm_a.value = 0.5
  @l_pwm_a.on
end



def self.move_forward
  front_right_forward
  front_left_forward
  back_left_forward
  back_right_forward
  sleep 5
end

def self.move_backward
  front_right_backward
  front_left_backward
  back_right_backward
  back_left_backward
end

def self.turn_left
  front_right_forward
  back_right_forward
  @f_l_f.off
  @b_l_f.off
  @r_pwm_b.vaule = 1
  @r_pwm_a.vaule = 1
  @r_pwm_b.on
  @r_pwm_a.on
end

def self.turn_right
  front_left_forward
  back_left_forward
  @f_r_f.off
  @b_r_f.off
  @l_pwm_b.vaule = 1
  @l_pwm_a.vaule = 1
  @l_pwm_b.on
  @l_pwm_a.on
end

def self.speed_up
  move_forward
  @pwm.each{|p|
    p.vaule = 1
    p.on
  }
end

def self.stop
  @all_wheels.each{|a| a.off}
end

# front_right_forward
# sleep(5)
# stop
# front_left_forward
# sleep(5)
# stop
# back_right_forward
# sleep(5)
# stop
# back_left_forward
# sleep(5)
# stop

end


