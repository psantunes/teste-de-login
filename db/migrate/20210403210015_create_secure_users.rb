class CreateSecureUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :secure_users do |t|
      t.string :login
      t.string :password_digest
      t.text :bio

      t.timestamps
    end
  end
end
