class PatientVitalSignGroupValidator < ActiveModel::Validator

  def validate(record)
    if check_value_by_vital_sign
      record.errors[:base] = "Record is invalid"
    end
  end

  private

  def check_value_by_vital_sign

  end
end