class Parcel < ApplicationRecord
    belongs_to :user
    validates :recipient_name ,presence: true
    validates :recipient_address, presence: true 
    validates :weight, presence: true 
    validates :from, presence: true 
    validates :destination, presence: true 

end
