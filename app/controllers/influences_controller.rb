class InfluencesController < ApplicationController

  def index
    @influences = Influence.all
  end

  def show
    @influence = Influence.find(params[:id])
  end
end
