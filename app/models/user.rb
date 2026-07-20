class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum role: { standard: 0, admin: 1 }

  before_validation :set_default_role

  private

  def set_default_role
    self.role ||= :standard
  end
end
