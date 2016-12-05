require 'httparty'

class PurchaseListsController < ApplicationController
  def index
    @purchase_lists = current_user.purchase_lists
  end

  def show
    @purchase_list = PurchaseList.find(params[:id])
  end

  def tracking
    render json: HTTParty.get("http://tracking.sweettracker.net/tracking?t_key=xXUNfjDrC1T6iC6PAe7LnQ&t_code=#{params[:company]}&t_invoice=#{params[:number]}")
  end
end
