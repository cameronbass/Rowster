class Subscriber < ActiveRecord::Base
  before_create :generate_mug_number
  after_create :subscribe_user_to_mailing_list

  scope :subscribing, -> {where subscription_date > 1.year.ago}
  scope :non_subscribing, -> {where.not subscription_date > 1.year.ago}

  has_many :comments
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\d{10}/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :presence => true, :uniqueness => true, :format => VALID_EMAIL_REGEX
  validates :phone_number, :presence => true, :uniqueness => true, :numericality => true, :format => VALID_PHONE_REGEX

  def date_joined
    created_at.strftime("%-m/%-d/%-y")
  end

  def expiration_date
    (created_at + 1.year).strftime("%-m/%-d/%-y")
  end

  def days_till_expired
    ((created_at + 1.year) - DateTime.now).to_i / 1.day
  end

  def subscribing?
    subscription_date > 1.year.ago
  end

  def self.set_subscribers_to_inactive
    find_each(active: false) do |subscriber|
      subscriber.inactive!
    end
  end

  def inactive!
    update(active: false) if subscription_date < 1.year.ago
  end

  private

  def subscribe_user_to_mailing_list
    SubscribeUserToMailingListJob.perform_later(self)
  end

  def generate_mug_number
    last_number = Subscriber.maximum(:mug_number) || 0
    self.mug_number = last_number + 1
  end
end
