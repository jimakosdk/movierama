# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  # --------------------- Associations --------------------------------
  has_many :movies, dependent: :destroy

  # --------------------- Mass Assignment -----------------------------
  attr_accessible :email, :name, :password_digest, :remember_token

  # --------------------- Validations --------------------------------
  validates :name, presence: true,
                   uniqueness: { :case_sensitive => false },
                   length: { within: 2..26}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { :case_sensitive => false },
                    format: { with: VALID_EMAIL_REGEX }

  # ---------------------- Callbacks ----------------------------------
  before_save :downcase_email # so as to ensure uniqueness

  # -------------- Instance Methods ------------------------------------

  def downcase_email
    self.email = email.downcase
  end
end