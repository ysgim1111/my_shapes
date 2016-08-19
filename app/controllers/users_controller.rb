class UsersController < ApplicationController
  def purchase_lists
    @purchase_lists = current_user.purchase_lists
  end
end
