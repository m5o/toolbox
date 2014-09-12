# encoding: utf-8
# Nifty Generators - https://github.com/ryanb/nifty-generators
#
# copy from Nifty Generators,
# markup optimized for bootstrap
#
# Usage:
#    <%= f.error_messages %>
#    <%= error_messages_for(@object) %>
#
module ErrorMessagesHelper
  # Render error messages for the given objects. The :message and :header_message options are allowed.
  def error_messages_for(*objects)
    options = objects.extract_options!
    options[:header_message] ||= I18n.t("errors.header", default: "Invalid Fields")
    options[:message] ||= I18n.t("errors.message", default: "Correct the following errors and try again.")
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten
    unless messages.empty?
      content_tag(:div, class: "alert alert-error alert-form") do
        list_items = messages.map { |msg| content_tag(:li, msg) }
        content_tag(:a, "&times;".html_safe, href: "#", class: "close", :"data-dismiss" => "alert") +
        content_tag(:h4, options[:header_message], class: "alert-heading") +
        content_tag(:p, options[:message]) +
        content_tag(:ul, list_items.join.html_safe)
      end
    end
  end

  module FormBuilderAdditions
    def error_messages(options = {})
      @template.error_messages_for(@object, options)
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)
