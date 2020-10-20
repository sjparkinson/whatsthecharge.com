# Patches to better support HTML output for Bootstrap 6

# Use the Bootstrap is-invalid class on form fields with failed validations
ActionView::Base.field_error_proc =
  Proc.new do |html_tag, instance|
    class_attr_index = html_tag.index 'class="'

    if class_attr_index
      html_tag.insert class_attr_index + 7, 'is-invalid '
    else
      html_tag.insert html_tag.index('>'), ' class="is-invalid"'
    end
  end
