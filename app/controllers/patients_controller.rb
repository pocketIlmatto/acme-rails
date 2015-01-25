class PatientsController < ApplicationController
  before_action :set_patient, only: [:show]
  before_action :authenticate_user!
  respond_to :html, :json

  def index
    respond_with @patients = current_user.patients
  end

  def show
    respond_with @patient
  end

  def new
    @patient = Patient.new
  end

  #Finding or creating patients
  def create
    @patient = Patient.find_by(patient_params)
    @patient ||= Patient.new(patient_params)
    if @patient.save
      @patient.patient_caretakers.find_or_create_by(user_id: current_user.id, role: current_user.title)
      redirect_to(@patient)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to(@patient)
    else
      render :edit
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