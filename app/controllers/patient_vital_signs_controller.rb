class PatientVitalSignsController < ApplicationController
  before_filter :authenticate_user!
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

  private
  def patient_vital_sign_params
    params.require(:patient_vital_sign).permit(:value, :units, :vital_sign_id, :measured_at)
  end

end