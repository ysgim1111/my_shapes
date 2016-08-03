class InfluencesController < ApplicationController

  def index
    @influences = Influence.all
  end

  def show
  end
end
