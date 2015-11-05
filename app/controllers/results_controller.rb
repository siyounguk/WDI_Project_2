class ResultsController < ApplicationController
  def index
    @rigs = Rig.search_by_guitarist(params[:q])
    Rig.search_by_guitarist(params[:q])
  end
end