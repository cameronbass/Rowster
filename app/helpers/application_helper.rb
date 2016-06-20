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
end
