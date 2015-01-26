namespace :db do
  
  desc "Create vital signs"
  task create_vital_signs: :environment do  
    VitalSign.create(name: "BP")
    VitalSign.create(name: "HR")
    VitalSign.create(name: "Weight")
    VitalSign.create(name: "Temp")
  end

  desc "Create organization"
  task create_organizations: :environment do
    Organization.create(name: "St. Francis Memorial Hospital", token: "SFMH")
    Organization.create(name: "UCSF Helen Diller Family", token: "UCSFHDF")
    Organization.create(name: "San Francisco General Hospital", token: "SFGH")
  end

  desc "Create organization super-users"
  task create_organization_super_users: :environment do
    Organization.all.each do |organization|
      user = User.create(email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        title: "Hospital administrator",
        password: 'password',
        password_confirmation: 'password')
      user.user_organizations.create(organization_id: organization.id, role: "Admin")
    end
  end

  desc "Create organization caretakers" 
  task create_organization_caretakers: :environment do
    titles = ["Cardiologist", "Intern", "Attending", "Hospitalist"]
    Organization.all.each do |organization|
      3.times do
        user = User.create(email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          title: titles[rand(titles.length)],
          password: 'password',
          password_confirmation: 'password')
        user.user_organizations.create(organization_id: organization.id)
      end
    end
  end

  desc "Create patient data"
  task create_patient_data: :environment do 
    10.times do
      Patient.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        dob: Faker::Date.between(90.years.ago, 15.years.ago),
        ssn: Faker::Medical::SSN.ssn,
        gender: Faker::Medical::Patient.gender
        )
    end
  end

  desc "Associate patient caretakers"
  task associate_patient_caretakers: :environment do
    Patient.all.each do |patient|
      rand(5).times do
        offset = rand(UserOrganization.where(role: nil).count)
        caretaker_id = UserOrganization.where(role: nil).offset(offset).first.user_id

        patient.patient_caretakers.create(user_id: caretaker_id, role: User.find(caretaker_id).title) unless caretaker_id.nil?
      end
    end
  end

  desc "Create patient vital signs"
  task create_patient_vital_signs: :environment do 
    10.times do  
      Patient.all.each do |patient|
        offset = rand(PatientCaretaker.where(patient_id: patient.id).count)
        caretaker_id = PatientCaretaker.where(patient_id: patient.id).offset(offset).first.user_id

        patient.patient_vital_signs.create(vital_sign_id: VitalSign.find_by(name: "BP").id, 
          value: "120/70", 
          measured_at: Faker::Date.between(10.days.ago, 1.hour.ago),
          user_id: caretaker_id)
        patient.patient_vital_signs.create(vital_sign_id: VitalSign.find_by(name: "HR").id, 
          value: rand(50..110).to_s, 
          measured_at: Faker::Date.between(10.days.ago, 1.hour.ago),
          user_id: caretaker_id)
        patient.patient_vital_signs.create(vital_sign_id: VitalSign.find_by(name: "Weight").id, 
          value: rand(80..250).to_s, 
          measured_at: Faker::Date.between(10.days.ago, 1.hour.ago),
          user_id: caretaker_id)
        patient.patient_vital_signs.create(vital_sign_id: VitalSign.find_by(name: "Temp").id, 
          value: rand(97..105).to_s, 
          measured_at: Faker::Date.between(10.days.ago, 1.hour.ago),
          user_id: caretaker_id)
      end
    end
  end

end