class ParcelSerializer < ActiveModel::Serializer
  attributes :id, :recipient_address, :recipient_name, :weight, :from, :destination, :totalcost, :recipient_contact,
             :user_id
  belongs_to :user
end
