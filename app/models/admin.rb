class Admin < ApplicationRecord
  after_destroy :ensure_an_admin_remains
  validates :email, presence: true, uniqueness: true
  has_secure_password

  class Error < StandardError
  end
  private
  def ensure_an_admin_remains
    if Admin.count.zero?
      raise Error.new "Can't delete last user"
    end
  end
end
