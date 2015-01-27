class Patient < ActiveRecord::Base
  validates :first_name, :last_name, :dob, presence: true
  has_many :patient_vital_signs
  has_many :vital_signs, through: :patient_vital_signs
  has_many :patient_caretakers
  has_many :users, through: :patient_caretakers
  attr_encrypted :first_name, key: 'abcdefg' #:patient_encryption_key
  attr_encrypted :last_name, key: 'abcdefg'
  attr_encrypted :ssn, key: 'abcdefg'
  attr_encrypted :gender, key: 'abcdefg'

  def name_last_first
    "#{self.last_name}, #{self.first_name}"
  end

  def name_first_last
    "#{self.first_name} #{self.last_name}"
  end

  def vitals_at_a_glance
    "HR: 90, BP: 120/30, Weight: 120 lbs, Temp: 90F"
  end

  def self.find_existing(pph)
    Patient.find_by_first_name_and_last_name_and_dob(pph[:first_name], pph[:last_name], DateTime.parse(pph[:dob]))
  end

end