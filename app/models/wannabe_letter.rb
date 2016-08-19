class WannabeLetter < ActiveRecord::Base
  enum status: [:waiting, :report, :respond]

  belongs_to :influencer_store
  belongs_to :purchase_list
end
