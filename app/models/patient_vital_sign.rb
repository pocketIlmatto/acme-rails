class PatientVitalSign < ActiveRecord::Base
  belongs_to :patient
  belongs_to :vital_sign
  validates :vital_sign_id, :patient_id, :value, presence: :true
end