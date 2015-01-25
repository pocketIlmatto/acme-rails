class AddUserToPatientVitalSigns < ActiveRecord::Migration
  def change
    add_column :patient_vital_signs, :user_id, :integer
    add_column :patient_vital_signs, :measured_at, :datetime
  end
end
