#Depricate
class VitalSign < ActiveRecord::Base
  validates :name, presence: :true, uniqueness: :true
  has_many :patient_vital_signs
  
  def by_patient(patient_id)
    self.patient_vital_signs.where(patient_id: patient_id)
  end
  
end