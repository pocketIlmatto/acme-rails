class CreatePatientVitalSigns < ActiveRecord::Migration
  def change
    create_table :patient_vital_signs do |t|
      t.integer :patient_id
      t.integer :vital_sign_id
      t.string :units
      t.string :value
      t.timestamps
      t.index :patient_id
      t.index :vital_sign_id
    end
  end
end
