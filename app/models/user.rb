class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: :true
  has_many :patients, through: :patient_caretakers
  has_many :patient_caretakers

  def name
    [first_name, last_name].compact.join(' ')
  end

end
