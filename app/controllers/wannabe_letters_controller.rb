class WannabeLettersController < ApplicationController
  def index
    @wannabe_letters = current_user.purchase_lists.joins(:wannabe_letter).select("wannabe_letters.*")
  end

  def new
    @wannabe_letter = WannabeLetter.new(purchase_list_id: params[:purchase_list_id], influencer_store_id: params[:influencer_store_id])
  end

  def create
    wannabe_letter = WannabeLetter.new(wannabe_letter_params)
    wannabe_letter.until_reply_date = Time.current + 7.day
    wannabe_letter.save

    redirect_to user_path
  end


  private

  def wannabe_letter_params
    params.require(:wannabe_letter).permit(:purchase_list_id, :influencer_store_id, :content)
  end
end
