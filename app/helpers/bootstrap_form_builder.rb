class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def label(method, text = nil, options = {}, &block)
    options.reverse_merge!(class: 'form-label')
    super
  end

  def text_field(method, options = {})
    options.reverse_merge!(class: 'form-control')
    super
  end

  def text_area(method, options = {})
    options.reverse_merge!(class: 'form-control')
    super
  end

  def url_field(method, options = {})
    options.reverse_merge!(class: 'form-control')
    super
  end

  def date_field(method, options = {})
    options.reverse_merge!(class: 'form-control')
    super
  end

  def number_field(method, options = {})
    options.reverse_merge!(class: 'form-control')
    super
  end

  def email_field(method, options = {})
    options.reverse_merge!(class: 'form-control')
    super
  end

  def password_field(method, options = {})
    options.reverse_merge!(class: 'form-control')
    super
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    html_options.reverse_merge!(class: 'form-select')
    super
  end

  def collection_select(
    method,
    collection,
    value_method,
    text_method,
    options = {},
    html_options = {}
  )
    html_options.reverse_merge!(class: 'form-select')
    super
  end

  def grouped_collection_select(
    method,
    collection,
    group_method,
    group_label_method,
    option_key_method,
    option_value_method,
    options = {},
    html_options = {}
  )
    html_options.reverse_merge!(class: 'form-select')
    super
  end
end
