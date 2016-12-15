class AutoCarController < ApplicationController
  def index

  end

  def move
     Car.move_forward
  end

  def back
     Car.move_backward
  end

  def left
    Car.turn_left
  end

  def right
    Car.turn_right
  end

  def stop
    Car.stop
  end

  def speed
    Car.speed_up
  end
end
