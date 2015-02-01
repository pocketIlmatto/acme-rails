class PatientVitalSign < ActiveRecord::Base
  belongs_to :patient
  belongs_to :vital_sign #Depreicate
  belongs_to :user
  validates :vital_sign_id, :patient_id, :user_id, :value, presence: :true #Depricate vital sign id
  
  #TODO add ordering by measured_at scope
  def self.measured_since(time)
    where("measured_at > ?", time)
  end

end
