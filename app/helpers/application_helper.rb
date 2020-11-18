# Application wide view helpers.
module ApplicationHelper # Set the page title in <head>
  def page_title(separator = ' &middot; ')
    title = ['What\'s the charge?']
    title.unshift @country.name if @country
    title.unshift content_for(:title)
    title.compact.join(separator).html_safe
  end

  # Set the page heading, prepends to <title> as well
  def page_heading(title)
    content_for(:title) { title }
    content_tag(:h2, title, class: 'mb-3')
  end

  # link_to for nav elements
  def link_to_manage_nav(body, url, html_options = {})
    classes = %w[nav-link]
    classes << 'active' if current_page?(url)
    classes << 'active' if url.include?(controller_name)
    html_options.merge!({ class: classes.join(' ') })
    content_tag :li do
      link_to body, url, html_options
    end
  end
end
