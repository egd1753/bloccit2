class Post < ApplicationRecord
  has_many :comments

  after_create :censure_post

  def censure_post
    if ( (self.id == 1) || ((self.id - 1) % 5 == 0) )
      self.title = "SPAM"
      self.save
    end
  end

end
