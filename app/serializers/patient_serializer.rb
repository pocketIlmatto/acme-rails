class PatientSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :dob
  
  has_many :patient_vital_signs
  has_many :patient_caretakers

end