class PatientTempSerializer < ActiveModel::Serializer
  attributes :value, :measured_at, :measured_by

  def measured_by
    object.user.name
  end

end