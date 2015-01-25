class PatientsController < ApplicationController
  before_action :set_patient, only: [:show]
  respond_to :html, :json

  def index
    respond_with @patients = Patient.all
  end

  def show
    respond_with @patient
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
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