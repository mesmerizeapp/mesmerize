class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = '@mesmerize.com'
  TEMP_EMAIL_REGEX = /\w@mesmerize.com\b/

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :identity, dependent: :destroy
  has_many :teams, through: :memberships
  has_many :ideas, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_ideas, source: :idea, through: :votes, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :resources, dependent: :destroy
  has_many :invitations, dependent: :destroy

  validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource || identity.user

    if user.blank?
      email = auth.info.email if auth.info.email && (auth.info.verified || auth.info.verified_email)

      if User.find_by(email: email).blank?
        user = User.new(
          name: auth.extra.raw_info.name,
          username: auth.info.nickname || auth.uid,
          image_url: auth.info.image,
          email: email ? email : "#{auth.info.nickname}-#{auth.provider}#{TEMP_EMAIL_PREFIX}",
          password: Devise.friendly_token[0,20]
        )
        # user.skip_confirmation!
        user.save!
      end
    end

    identity.update_attribute(:user, user) if identity.user != user

    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def image
    self.image_url.gsub('_normal', '')
  end
end
