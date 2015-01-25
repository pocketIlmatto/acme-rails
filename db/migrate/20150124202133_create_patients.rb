class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :last_name
      t.string :first_name
      t.date :dob
      t.timestamps
    end
  end
end
