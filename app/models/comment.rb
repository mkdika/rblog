class Comment < ApplicationRecord
  belongs_to :post

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true, message: 'email format is not valid' } 
end
