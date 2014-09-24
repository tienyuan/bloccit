class FavoriteMailer < ActionMailer::Base
  default from: "tien@tienwrites.com"

  def new_comment(user, post, comment)

    # New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@tienyuan-bloccit.example>"
    headers["In-Reply_To"] = "<post/#{post.id}@tienyuan-bloccit.example>"
    headers["References"] = "<post/#{post.id}@tienyuan-bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
