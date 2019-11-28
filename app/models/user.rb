class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :lockable,
         :recoverable, :rememberable

  validates :email, presence: true
  
  def show_display_name
    self.display_name.present? ? self.display_name : self.email
  end

  def locked?
    self.locked_at.present?
  end
end