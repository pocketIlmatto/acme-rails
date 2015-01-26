class CreateUserOrganizations < ActiveRecord::Migration
  def change
    create_table :user_organizations do |t|
      t.integer :organization_id
      t.integer :user_id
      t.string :role
      t.timestamps
      t.index :user_id
      t.index :organization_id
    end
  end
end
