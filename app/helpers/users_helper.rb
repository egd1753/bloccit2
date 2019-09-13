module UsersHelper

  def user_posts(current_user)
    if current_user.posts.length < 1
      "#{current_user.name} has not submitted any posts yet."
    end
  end


  def user_comments(current_user)
    if current_user.comments.length < 1
      "#{current_user.name} has not submitted any comments yet."
    end

  end


  def user_favorites(current_user)
    if current_user.favorites.length < 1
      "#{current_user.name} has not favorited any posts yet"
    end
  end

  def author_gravatar(user)
    author_email_address = user.email
    gravatar_id = Digest::MD5.hexdigest(author_email_address)
    "https://www.gravatar.com/avatar/#{gravatar_id}"
  end

end
