class Student < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :enrollments
  has_many :results

  validates :name, :image, :address, :mobile, presence: true
  validates :image, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
