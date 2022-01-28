class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.text :email
      t.text :password_digest
      t.text :profile_pic

      t.timestamps
    end
  end
end
