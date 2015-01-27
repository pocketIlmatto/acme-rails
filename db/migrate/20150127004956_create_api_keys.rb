class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :encrypted_access_token
      t.string :client_name
      t.timestamps null: false
    end
  end
end
