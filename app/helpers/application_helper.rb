module ApplicationHelper
  def flash_class(name)
    alert_type = case name.to_s
      when 'notice'  then 'alert-success'
      when 'error'   then 'alert-danger'
      when 'alert'   then 'alert-danger'
      when 'info'    then 'alert-info'
      when 'warning' then 'alert-warning'
      else "alert-#{name}"
    end
    alert_type
  end

  def post_link(post)
    return post.link if post.link?
    return post_path(post) if post.text?
  end

  def post_link_path(post)
    return post.link if post.link?
    return post_path(post) if post.text?
  end

  def post_title_link(post)
    content_tag :div, class: 'title' do
      link_to post.title, post_link_path(post)
    end
  end

end
