module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
  
  def my_name
    "Tien Yuan"
  end

  private 
  
  def vote_link_classes(direction, post)
    g = "glyphicon glyphicon-"
    if direction == :up
      g << "chevron-up " + (current_user.voted(post) && current_user.voted(post).up_vote? ? 'voted' : '' )
    else
      g << "chevron-down " + (current_user.voted(post) && current_user.voted(post).down_vote? ? 'voted' : '' )
    end
  end
end
