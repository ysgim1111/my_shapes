class WelcomeController < ApplicationController
  def index
  end
  def chamsari
    @place = Place.where(:category => 1)
  end
  def junghu
    @place = Place.where(:category => 2)
  end
  def bupphu
    @place = Place.where(:category => 3)
  end
  def jungmun
    @place = Place.where(:category => 4)
  end
  def jaegidong
    @place = Place.where(:category => 5)

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
    flash[:notice] = "등록이 완료되었습니다"
    redirect_to '/'
  end
end
