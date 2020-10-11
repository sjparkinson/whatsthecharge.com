# Application wide view helpers.
module ApplicationHelper
  def page_title(separator = " &middot; ")
    [content_for(:title), 'What\'s the charge?'].compact.join(separator).html_safe
  end

  def page_heading(title)
    content_for(:title) { title }
    content_tag(:h2, title)
  end
end
