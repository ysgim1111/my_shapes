class WannabeLettersController < ApplicationController
  def index
    @purchase_lists = current_user.purchase_lists
    @wannabe_letter = WannabeLetter.new
  end

  def create
    wannabe_letter = WannabeLetter.new(wannabe_letter_params)
    wannabe_letter.until_reply_date = Time.current + 7.day
    wannabe_letter.save

    redirect_to action: :index
  end


  private

  def wannabe_letter_params
    params.require(:wannabe_letter).permit(:purchase_list_id, :influencer_store_id, :content)
  end
end
