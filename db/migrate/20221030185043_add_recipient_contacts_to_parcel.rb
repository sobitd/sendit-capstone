class AddRecipientContactsToParcel < ActiveRecord::Migration[7.0]
  def change
    add_column :parcels, :recipient_contact, :string
  end
end
