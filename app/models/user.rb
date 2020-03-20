class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :validatable,
  :token_authenticatable
  has_many :authentication_tokens

end
