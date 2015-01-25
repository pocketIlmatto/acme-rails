class PatientVitalSignPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
    @current_user = current_user
    @patient_vital_sign = model
  end

  def show?
    is_patient_caretaker?
  end

  def edit?
    is_patient_caretaker?
  end

  def update?
    is_patient_caretaker?
  end

  def create?
    is_patient_caretaker?
  end

  private
  def is_patient_caretaker?
    @current_user.patients.exists?(@patient_vital_sign.patient)
  end

end