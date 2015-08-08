class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :dashboard

  has_many :habits,
    dependent: :destroy
  has_many :daily_habits

  # TODO: Handle TempUser better.
  # TODO: Add phone_number validation to ensure numbers are formatted correctly
  def self.from_phone(phone_number)
    where(phone_number: phone_number) || TemporaryUser.new
  end
end

