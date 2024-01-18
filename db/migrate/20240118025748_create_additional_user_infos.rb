class CreateAdditionalUserInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :additional_user_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :avatar
      t.string :address
      t.string :city
      t.string :country
      t.string :postal_code
      t.string :phone_number
      t.date :date_of_birth

      t.timestamps
    end
  end
end
