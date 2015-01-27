class PatientVitalSignSerializer < ActiveModel::Serializer
  attributes :vital_sign, :value, :measured_at, :measured_by

  def measured_by
    object.user.name
  end

  def vital_sign
    object.vital_sign.name
  end

end