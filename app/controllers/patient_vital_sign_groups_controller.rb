class PatientVitalSignGroupsController < ApplicationController

  def create
    @patient = Patient.find(params[:patient_id])
    ppv_params_date = params[:patient_vital_sign_group]
    #TODO this logic belongs in a helper
    measured_at = DateTime.new(ppv_params_date["measured_at(1i)"].to_i,
                           ppv_params_date["measured_at(2i)"].to_i,
                           ppv_params_date["measured_at(3i)"].to_i,
                           ppv_params_date["measured_at(4i)"].to_i,
                           ppv_params_date["measured_at(5i)"].to_i)
    @patient_vital_sign_group = PatientVitalSignGroup.new(pvs_params)
    if @patient_vital_sign_group.valid?
        
      patient_vital_signs = []
      #BP
      patient_vital_signs << @patient.patient_vital_signs
        .build( vital_sign_id: VitalSign.find_by_name("PatientBloodPressure").id,
                value: pvs_params[:bp], 
                measured_at: measured_at,
                user_id: current_user.id,
                type: "PatientBloodPressure") unless pvs_params[:bp].empty?
      #HR
      patient_vital_signs << @patient.patient_vital_signs
        .build( vital_sign_id: VitalSign.find_by_name("PatientHeartRate").id,
                value: pvs_params[:hr], 
                measured_at: measured_at,
                user_id: current_user.id,
                type: "PatientHeartRate") unless pvs_params[:hr].empty?
      
      #Weight
      patient_vital_signs << @patient.patient_vital_signs
        .build( vital_sign_id: VitalSign.find_by_name("PatientWeight").id,
                value: pvs_params[:weight], 
                measured_at: measured_at,
                user_id: current_user.id,
                type: "PatientWeight") unless pvs_params[:weight].empty?
      
      #Temp
      patient_vital_signs << @patient.patient_vital_signs
        .build( vital_sign_id: VitalSign.find_by_name("PatientTemp").id,
                value: pvs_params[:temp], 
                measured_at: measured_at,
                user_id: current_user.id,
                type: "PatientTemp") unless pvs_params[:temp].empty?
      
      #validate as a group
      all_valid = true
      patient_vital_signs.each do |patient_vital_sign|
        if !patient_vital_sign.valid?
          all_valid = false
          @patient_vital_sign_group.errors << patient_vital_sign.errors.full_messages
        end
      end

      #save as a group
      if all_valid
        patient_vital_signs.each do |patient_vital_sign|
          authorize patient_vital_sign
          patient_vital_sign.save
        end
        @patient.reload.patient_vital_signs
      end
    end
    redirect_to(@patient)
    
  end

  
  private
  
  def pvs_params
    params.require(:patient_vital_sign_group).permit(:bp, :hr, :temp, :weight)
  end

end