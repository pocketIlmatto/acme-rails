namespace :db do
  
  desc "Create patient data"
  task create_patient_data: :environment do 
    10.times do
      Patient.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        dob: Faker::Date.between(90.years.ago, 15.years.ago)
        )
    end
  end

  desc "Create vital signs"
  task create_vital_signs: :environment do  
    VitalSign.create(name: "BP")
    VitalSign.create(name: "HR")
    VitalSign.create(name: "Weight")
    VitalSign.create(name: "Temp")
  end

  desc "Create patient vital signs"
  task create_patient_vital_signs: :environment do 
    
    Patient.all.each do |patient|
      patient.patient_vital_signs.create(vital_sign_id: VitalSign.find_by(name: "BP").id, value: "120/70")
      patient.patient_vital_signs.create(vital_sign_id: VitalSign.find_by(name: "HR").id, value: rand(50..110).to_s)
      patient.patient_vital_signs.create(vital_sign_id: VitalSign.find_by(name: "Weight").id, value: rand(80..250).to_s)
      patient.patient_vital_signs.create(vital_sign_id: VitalSign.find_by(name: "Temp").id, value: rand(97..105).to_s)
    end
  end
end