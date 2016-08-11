class Destination < ActiveRecord::Base
  belongs_to :user

  def self.update_or_create(destination_id, destination_params, user)
    if destination_id.present?
      destination = Destination.find(destination_id)
      destination.update_attributes(destination_params)
    else
      destination = Destination.create(destination_params) do |destination|
        destination.user = user
      end
    end

    destination
  end
end
