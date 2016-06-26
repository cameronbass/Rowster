module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    if column != sort_column
      css_class = nil
      direction = "asc"
    elsif sort_direction == "asc"
      css_class = "glyphicon glyphicon-triangle-top"
      direction = "desc"
    else
      css_class = "glyphicon glyphicon-triangle-bottom"
      direction = "asc"
    end
    link_to "#{title} <span class='#{css_class}'></span>".html_safe, sort: column, direction: direction
  end

  def avatar_url(subscriber)
    gravatar_id = Digest::MD5.hexdigest(subscriber.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
