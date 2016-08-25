class Cms::WannabeLettersController < BaseCmsController
  def index
    @wannabe_letters = current_user.is_admin? ? WannabeLetter.all : current_user.wannabe_letters
    @wannabe_letters = @wannabe_letters.where(status: params[:status]) if params[:status].present?
    @wannabe_letters = @wannabe_letters.where("until_reply_date <= ?", params[:reply_date]) if params[:reply_date].present?
  end

  def update
    if params[:status].present?
      wannabe_letter = WannabeLetter.find(params[:id])
      wannabe_letter.update(status: params[:status])
    elsif params[:reply].present?
      wannabe_letter = WannabeLetter.find(params[:id])
      wannabe_letter.update(reply: params[:reply])
    end

    render json: wannabe_letter
  end
end
