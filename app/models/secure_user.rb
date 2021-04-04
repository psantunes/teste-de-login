class SecureUser < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper
 
  has_secure_password
  validates_format_of :login, with: /\A[a-zA-Z0-9]*$\Z/i, on: %i[create update]

  before_save do |user|
    user.bio = strip_tags(user.bio)
  end
end