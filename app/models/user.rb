class User < ActiveRecord::Base
  alias_method :guest?, :new_record?

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: Settings.omniauth.available_providers

  as_enum :gender, [:female, :male]
  as_enum :role, [:client, :admin]

  has_many :providers, dependent: :destroy
  has_many :places, foreign_key: :owner_id, dependent: :destroy

  def password_required?
    (providers.empty? || password.present?) && super
  end

  def self.new_with_session(params, session)
    if session["devise.omniauth"]
      UserRegistration.new(session["devise.omniauth"]).build_from_auth(params)
    else
      super
    end
  end
end
