module ApplicationHelper

#Translate rails flash levels to appropriate Twitter
#Bootstrap CSS Classes.

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error   then "alert alert-error"
      when :alert   then "alert alert-error"
    end
  end

  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
              autolink: true, space_after_headers: true,
              fenced_code_blocks: true, no_intra_emphasis: true,
              lax_spacing: true, no_intraemphasis: true)
    @markdown.render(content)
  end
end
