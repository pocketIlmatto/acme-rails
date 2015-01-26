class PatientPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
    @current_user = current_user
    @patient = model
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

  class Scope < Struct.new(:current_user, :model)
    def resolve
      model.joins(:users).where("users.id = #{current_user.id}")
    end
  end

  private
  def is_patient_caretaker?
    @current_user.patients.exists?(@patient.id)
  end

end