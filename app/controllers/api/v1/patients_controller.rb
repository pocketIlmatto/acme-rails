class Api::V1::PatientsController < Api::ApiController
  before_filter :restrict_access
  before_action :set_patient, only: [:show, :edit]

  def index
    respond_with Patient.all
  end

  def show
    respond_with @patient
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      respond_with @patient
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