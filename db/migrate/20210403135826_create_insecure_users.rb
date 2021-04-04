class CreateInsecureUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :insecure_users do |t|
      t.string :login
      t.string :password
      t.text :bio

      t.timestamps
    end
  end
end
