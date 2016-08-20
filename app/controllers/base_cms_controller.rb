class BaseCmsController < ApplicationController
  before_action :authenticate_user!

  layout "cms"

  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, alert: "권한이 없습니다"
  end

  def redirect_to_root_path_by_base_authority
    if current_user.is_influencer?
      if current_user.influencer_store
        redirect_to cms_influencer_store_path(current_user.influencer_store)
      else
        redirect_to new_cms_influencer_store_path
      end
    else
      redirect_to cms_products_path
    end
  end
end
