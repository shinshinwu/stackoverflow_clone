class Answer < ActiveRecord::Base
  belongs_to :question
  default_scope -> { order(votes: :desc)}
  validates :title, presence: true
  validates :content, presence: true

  def upvote
    self.votes += 1
    self.save
  end

  def downvote
    self.votes -= 1
    self.save
  end
end
