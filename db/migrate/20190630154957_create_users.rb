class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :authentication_token, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
