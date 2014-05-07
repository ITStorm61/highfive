class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :provider
      t.string :picture_url
      t.string :picture_large_url
      t.string :email

      t.timestamps
    end
  end
end
