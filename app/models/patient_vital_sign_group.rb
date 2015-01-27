class PatientVitalSignGroup
  include ActiveModel::Model
  
  attr_accessor :patient_id, :bp, :hr, :weight, :temp, :measured_at, :user_id

end