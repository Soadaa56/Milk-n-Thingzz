class User < ApplicationRecord
  pay_customer default_payment_processor: :stripe, stripe_attributes: :stripe_attributes
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
      address: {
        line1: pay_customer.owner.line1,
        line2: pay_customer.owner.line2,
        postal_code: pay_customer.owner.postal_code,
        state: pay_customer.owner.state,
        city: pay_customer.owner.city,
        country: pay_customer.owner.country
      },
      metadata: {
        pay_customer_id: pay_customer.id,
        user_id: id
      }
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
