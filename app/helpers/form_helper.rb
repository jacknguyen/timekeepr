module FormHelper
  def errors_for(form, field)
    content_tag(:p, form.object.errors[field].try(:first), class: 'help-block')
  end

    #takes the form that we're working with, the particular fields, and a block
  def form_group_for(form, field, &block)
    #checks if the form field has errors
    has_errors = form.object.errors[field].present?

    #then it's going to create a div with the styles that bootstrap 3 expects
    content_tag :div, class: "form-group #{'has-error' if has_errors}" do
      #then it's going to create a lable for our field
      concat form.label(field, class: 'control-label')
      #output whatever is in the block, in this case it's going to be an input
      concat capture(&block)
      #then it's going to output any errors associated with that field
      concat errors_for(form, field)
    end
  end
end
