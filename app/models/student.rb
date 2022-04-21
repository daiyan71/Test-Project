class Student < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :enrollments
  has_many :results
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
