module ApplicationHelper
  def is_active?(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, nil, class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")}) # nil ipv '#'
  end

  def bootstrap_class_for flash_type
    case flash_type
    when :success
      "alert-success" # Green
    when :error
      "alert-danger" # Red
    when :alert
      "alert-warning" # Yellow
    when :notice
      "alert-info" # Blue
    else
    flash_type.to_s
    end
  end

  def sortable(column, title = nil)
    # short for title = title || column.titleize (local variables)
    title ||= column.titleize
    icon = sort_direction == "asc" ? "glyphicon glyphicon-triangle-top" : "glyphicon glyphicon-triangle-bottom"
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    icon = column == sort_column ? icon : ""
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to params.merge(:sort => column, :direction => direction, :page => nil, :class => css_class).permit! do
      "#{title} <span class='#{icon}'></span>".html_safe
    end

  end
end
