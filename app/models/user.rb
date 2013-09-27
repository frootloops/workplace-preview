class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  as_enum :gender, [:female, :male]

end
