namespace :db do
  
  desc "Convert to STI"
  task convert_to_STI: :environment do  
    #first, rename the vital signs
    vs = VitalSign.find_by_name("BP")
    unless vs.nil?
      vs.name = "PatientBloodPressure"
      vs.save
    end

    
    vs = VitalSign.find_by_name("HR")
    unless vs.nil?
      vs.name = "PatientHeartRate"
      vs.save
    end

    vs = VitalSign.find_by_name("Weight")
    unless vs.nil?
      vs.name = "PatientWeight"
      vs.save
    end

    vs = VitalSign.find_by_name("Temp")
    unless vs.nil?
      vs.name = "PatientTemp"
      vs.save
    end
    #second, populate the type on patientVitalSigns
    vs = VitalSign.find_by_name("PatientBloodPressure")
    unless vs.nil?
      vs.patient_vital_signs.update_all(type: "PatientBloodPressure")
    end
    vs = VitalSign.find_by_name("PatientHeartRate")
    unless vs.nil?
      vs.patient_vital_signs.update_all(type: "PatientHeartRate")
    end
    vs = VitalSign.find_by_name("PatientWeight")
    unless vs.nil?
      vs.patient_vital_signs.update_all(type: "PatientWeight")
    end
    vs = VitalSign.find_by_name("PatientTemp")
    unless vs.nil?
      vs.patient_vital_signs.update_all(type: "PatientTemp")
    end
    
    #later, the vital_sign_id will be dropped in a migration
  end

end