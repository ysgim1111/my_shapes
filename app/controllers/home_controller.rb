class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:upload, :create, :ev]
  
  
  
  
  def index
    @tvs = Tv.all
    @banner = @tvs.sample #4개중에 랜덤추출
    
  end

  def detail
    @pro = Tv.find(params[:id])
    
    
  end
  
  def ev
    Comment.create(user_id: current_user.id,
                   tv_id: params[:tv_id].to_i,
                   comment: params[:msg],
                   score: params[:rating].to_i)
    redirect_to :back
  end
  
  def upload
  end
  
  def create
    a = Tv.create(title: params[:jemock], img: params[:url], intro: params[:sogae])
    redirect_to "/home/detail/#{a.id}"
  end
end
