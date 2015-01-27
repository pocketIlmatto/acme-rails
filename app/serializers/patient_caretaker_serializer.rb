class PatientCaretakerSerializer < ActiveModel::Serializer
  attributes :caretaker, :role, :active_since

  def caretaker
    object.user.name
  end

  def active_since
    object.created_at
  end

end