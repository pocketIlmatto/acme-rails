class PatientSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :dob
  
  has_many :patient_blood_pressures
  has_many :patient_heart_rates
  has_many :patient_temps
  has_many :patient_weights
  has_many :patient_caretakers

end