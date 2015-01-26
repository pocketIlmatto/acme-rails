#TODO - not in use yet by Patient model since receiving No Implicit conversion from
#symbol to string errors when attempting find_by_attrname 
require 'active_support/concern'

module Encryption  
  extend ActiveSupport::Concern
  
  def org_encryption_key
    # if in production. require key to be set.
    if Rails.env.production?
      raise 'Must set token key!!' unless ENV['ORG_KEY']
      ENV['ORG_KEY']
    else
      ENV['ORG_KEY'] ? ENV['ORG_KEY'] : 'abcdefg'
    end
  end

  def patient_encryption_key
    # if in production. require key to be set.
    if Rails.env.production?
      raise 'Must set token key!!' unless ENV['PATIENT_KEY']
      ENV['PATIENT_KEY']
    else
      ENV['PATIENT_KEY'] ? ENV['PATIENT_KEY'] : 'abcdefg'
    end
  end

end