class WelcomeController < ApplicationController
  def index
  end
  def chamsari
  end
  def junghu
  end
  def bupphu
  end
  def jungmun
  end
  def new

  end
  def create_new
    place = Place.new
    place.category = params[:category]
    place.name = params[:name]
    place.price = params[:price]
    place.desc = params[:desc]
    place.save
    redirect_to '/'
  end
end
