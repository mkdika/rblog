require 'markdown_helper'

class Comment < ApplicationRecord

  include MarkdownHelper

  has_paper_trail
  
  belongs_to :post

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true, message: 'email format is not valid' } 
  validates :name, :content, presence: true

end
