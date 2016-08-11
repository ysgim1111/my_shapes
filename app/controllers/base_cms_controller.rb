class BaseCmsController < ApplicationController
  before_action :authenticate_user!

  authorize_actions_for Product
  authorize_actions_for InfluencerStore
  authorize_actions_for InfluencerStoresProduct

  layout "cms"

  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, alert: 'You are not authorized to complete that action.'
  end
end
