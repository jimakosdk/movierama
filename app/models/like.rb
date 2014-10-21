# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  movie_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ActiveRecord::Base

  # --------------------- Associations --------------------------------
  belongs_to :movie
  belongs_to :user

  # --------------------- Mass Assignment -----------------------------
  attr_accessible :movie_id, :user_id

  # --------------------- Validations --------------------------------
  validates_uniqueness_of :movie_id, scope: :user_id
  validate :self_liking_prevention

  # --------------------- Private ------------------------------------
  private

  def self_liking_prevention
    if Movie.find(self.movie_id).user == self.user
      self.errors[:user_id] << 'Cannot like your own movies!'
    end
  end
                   
end
