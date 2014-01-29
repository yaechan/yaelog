module ApplicationHelper
  def page_title
    title = "Yae's Room"
    title = @page_title + " - " + title if @page_title
    title
  end

  def menu_link_to(text, path)
  	link_to_unless_current(text, path) { content_tag(:span, text) }
  end

  def markdown(text)
    html_render = HtmlWithPygments.new(hard_wrap: true, filter_html: true)
    markdown = Redcarpet::Markdown.new(html_render,
                                       autolink: true,
                                       fenced_code_blocks: true,
                                       space_after_headers: true,
                                       tables: true,
                                       no_intra_emphasis: true,
                                       strikethrough: true)
    return markdown.render(text).html_safe
  end

  class HtmlWithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language, options: { encoding: 'utf-8' })
    end
  end

end
