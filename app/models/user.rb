class User < ApplicationRecord
  pay_customer stripe_attributes: :stripe_attributes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum :role, { standard: 0, admin: 1 }

  has_one :cart
  has_many :cart_items, through: :cart

  before_validation :set_default_role

  def stripe_attributes(pay_customer)
    {

    }
  end

  def pay_should_sync_customer?
    # super will invoke Pay's default (e-mail changed)
    super || self.saved_change_to_address? || self.saved_change_to_name?
  end

  private

  def set_default_role
    self.role ||= :standard
  end
end
