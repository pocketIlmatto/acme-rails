class Api::V1::PatientsController < Api::ApiController
  before_filter :restrict_access
  before_action :set_patient, only: [:show, :edit]

  def index
    @patients = PatientPolicy::Scope.new(current_user, Patient).resolve
    respond_with @patients
  end

  def show
    authorize @patient
    respond_with @patient
  end

  def create
    @patient = Patient.find_existing(patient_params)
    @patient ||= Patient.new(patient_params)
    if @patient.save
      @patient.patient_caretakers.find_or_create_by(user_id: current_user.id, 
        role: current_user.title)
      respond_with(@patient)
    else
      render json: { errors: @patient.errors }, status: 422
    end
  end

  private
  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob)
  end
  
end