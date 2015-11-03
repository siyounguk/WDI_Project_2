class HomeController < ApplicationController
  def index
    @pedals = Pedal.all.to_a.sort_by! { |pedal| 0 - pedal.get_likes.size }.slice(0,10)
  end
end
