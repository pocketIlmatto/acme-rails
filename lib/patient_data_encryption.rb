#TODO need more research
module PatientDataEncryption
  def self.included(base)
    base.class_eval do
      attr_encrypted :dob, :key => "my_dob_key",
                     :marshal => true, :marshaler => DateMarshaler
    end
  end

  class DateMarshaler
    def self.dump(date)
      # if our "date" is already a string, don't try to convert it
      date.is_a?(String) ? date : date.to_s(:db)
    end

    def self.load(date_string)
      Date.parse(date_string)
    end
  end
end