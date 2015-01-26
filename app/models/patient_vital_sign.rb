class PatientVitalSign < ActiveRecord::Base
  belongs_to :patient
  belongs_to :vital_sign
  belongs_to :user
  validates :vital_sign_id, :patient_id, :value, presence: :true

  def self.measured_since(time)
    where("measured_at > ?", time)
  end

end