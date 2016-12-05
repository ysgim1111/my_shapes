class AddressBook < ActiveRecord::Base
  belongs_to :user

  def self.update_or_create(address_id, address_params, user)
    if address_id.present?
      address = find(address_id)
      address.update_attributes(address_params)
    else
      address = create(address_params) do |address|
        address.user = user
      end
    end

    address
  end
end
