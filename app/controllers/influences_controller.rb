class InfluencesController < ApplicationController

  def index
    @influences = Influence.all
    @products = Product.all
  end

  def show
  end
end
