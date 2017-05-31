module ApplicationHelper
  def flash_class(level)
    case level
    when "notice" then "alert-info"
    when "success" then "alert-success"
    when "error" then "alert-error"
    when "alert" then "alert-error"
    end
  end

  def recent_posts
    recent_posts = Article.where(published: true).first(3)
  end
end
