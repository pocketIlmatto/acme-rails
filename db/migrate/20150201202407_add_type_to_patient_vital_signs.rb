class AddTypeToPatientVitalSigns < ActiveRecord::Migration
  def change
    add_column :patient_vital_signs, :type, :string
  end
end
