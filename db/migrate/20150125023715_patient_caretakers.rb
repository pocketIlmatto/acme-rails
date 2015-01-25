class PatientCaretakers < ActiveRecord::Migration
  def change
    create_table :patient_caretakers do |t|
      t.integer :patient_id
      t.integer :user_id
      t.string  :role
      t.timestamps
    end
  end
end
