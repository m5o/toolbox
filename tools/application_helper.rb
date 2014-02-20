# encoding: utf-8

module ApplicationHelper

  # html markup helper
  def title_element(prefix = '', suffix = '')
    content_tag(:title, prefix + @page.title + @page.name + suffix)
  end

  def description_meta_tag
    tag(:meta, { name: "description", content: @page.meta_description })
  end

  def keywords_meta_tag
    tag(:meta, { name: "keywords", content: @page.meta_keywords })
  end

  def body_element(body_class = nil)
    body_id = "#{controller_path.tr('/', '_')}_#{action_name}"
    tag("body", { id: body_id , class: body_class }, true)
  end

end
