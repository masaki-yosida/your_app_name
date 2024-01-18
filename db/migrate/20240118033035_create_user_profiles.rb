class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :city
      t.string :country
      t.string :postal_code
      t.string :phone_number
      t.string :avatar
      t.string :gender

      t.timestamps
    end
  end
end
