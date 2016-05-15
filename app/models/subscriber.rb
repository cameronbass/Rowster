class Subscriber < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

  def date_joined
    created_at.strftime("%-m/%-d/%-y")
  end

  def expiration_date
    (created_at + 1.year).strftime("%-m/%-d/%-y")
  end

  def sign_in
  end
end
