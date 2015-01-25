class PatientVitalSignsController < ApplicationController
  respond_to :html, :json

  def create
    @patient = Patient.find(params[:patient_id])
    @patient_vital_sign = @patient.patient_vital_signs.build(patient_vital_sign_params)

    if @patient_vital_sign.save
      redirect_to(@patient)
    else
      @patient.reload.patient_vital_signs
      redirect_to(@patient)
    end
  end

  private
  def patient_vital_sign_params
    params.require(:patient_vital_sign).permit(:value, :units, :vital_sign_id)
  end

end