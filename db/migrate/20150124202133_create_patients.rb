class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :encrypted_last_name
      t.string :encrypted_first_name
      t.date :dob
      t.string :encrypted_ssn
      t.string :encrypted_gender
      t.timestamps
    end
  end
end
