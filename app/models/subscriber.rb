class Subscriber < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\d{7}/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
            :presence => true,
            :uniqueness => true,
            :format => VALID_EMAIL_REGEX
  validates :phone_number,
            :presence => true,
            :uniqueness => true,
            :numericality => true,
            :format => VALID_PHONE_REGEX

  def date_joined
    created_at.strftime("%-m/%-d/%-y")
  end

  def expiration_date
    (created_at + 1.year).strftime("%-m/%-d/%-y")
  end

  def days_till_expired
    ((created_at + 1.year) - DateTime.now).to_i / 1.day
  end
end
