class Patient < ActiveRecord::Base
  validates :first_name, :last_name, :dob, presence: true
  has_many :patient_vital_signs
  has_many :vital_signs, through: :patient_vital_signs

  def name_last_first
    "#{self.last_name}, #{self.first_name}"
  end

  def name_first_last
    "#{self.first_name} #{self.last_name}"
  end

  def vitals_at_a_glance
    "HR: 90, BP: 120/30, Weight: 120 lbs, Temp: 90F"
  end

end