module MarkdownHelper

  def content_to_html
    begin
      renderer = CodeRayify.new(filter_html: true, hard_wrap: true)
      markdown = Redcarpet::Markdown.new(
        renderer,
        fenced_code_blocks: true,
        autolink: true,
        tables: true,
        strikethrough: true,
        lax_spacing: true,
        space_after_headers: true,
      )
      markdown.render(content).html_safe
    rescue TypeError => exception
      Rails.logger.warn("content is nil while execute 'content_to_html'")
      ''
    end
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end
end
