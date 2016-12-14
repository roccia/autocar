class AutoCarController < ApplicationController
  def index

  end

  def move
     Car.move_forward
  end
end
