class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable

  as_enum :gender, [:female, :male]
  as_enum :role, [:client, :admin]

  has_many :providers, dependent: :destroy
end
