class PatientVitalSignsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_patient_vital_sign, only: [:update]
  respond_to :html, :json

  def create
    @patient = Patient.find(params[:patient_id])
    @patient_vital_sign = @patient.patient_vital_signs.build(patient_vital_sign_params)
    @patient_vital_sign.user_id = current_user.id
    authorize @patient_vital_sign
    
    if @patient_vital_sign.save
      redirect_to(@patient)
    else
      @patient.reload.patient_vital_signs
      redirect_to(@patient)
    end
  end

  def edit
    authorize @patient_vital_sign
  end

  def update
    authorize @patient_vital_sign
    respond_to do |format|
      if @patient_vital_sign.update(patient_vital_sign_params)
        @patient = @patient_vital_sign.patient
        format.html {render @patient, notice: 'Vital sign updated.'}
        format.json { head :no_content } 
      else
        format.html { render action: "edit" }
        format.json { render json: @patient_vital_sign.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_patient_vital_sign
    @patient_vital_sign = PatientVitalSign.find(params[:id])
  end

  def patient_vital_sign_params
    params.require(:patient_vital_sign).permit(:value, :units, :vital_sign_id, :measured_at)
  end

end