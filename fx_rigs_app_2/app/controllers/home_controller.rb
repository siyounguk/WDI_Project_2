class HomeController < ApplicationController
  def index
    @pedals = Pedal.all.order(:cached_votes_total => :desc).slice(0,10)
    @rigs = Rig.all.order(:cached_votes_total => :desc).slice(0,10)

    
  end
end
