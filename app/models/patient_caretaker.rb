class PatientCaretaker < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user
  validates :patient_id, :user_id, presence: :true
  validates :patient_id, uniqueness: { scope: :user_id, message: "should only be associated with the caretaker once"}
end