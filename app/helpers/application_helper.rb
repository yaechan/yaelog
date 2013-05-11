module ApplicationHelper
  def page_title
    title = "Yae's Room"
    title = @page_title + " - " + title if @page_title
    title
  end

  def menu_link_to(text, path)
  	link_to_unless_current(text, path) { content_tag(:span, text) }
  end

#  def markdown(text)
#  	rndr_options = { hard_wrap: true, filter_html: true }
#  	options = { tables: true,
#  		        autolink: true,
#  		        fenced_code_blocks: true,
#  		        no_intra_emphasis: true }
#  	rndr = Redcarpet::Render::HTML.new(rndr_options)
#  	markdown = Redcarpet::Markdown.new(rndr, options)
#  	syntax_highlighter(markdown.render(text)).html_safe
#  end

#  def syntax_highlighter(html)
#  	doc = Nokogiri::HTML(html)
#  	doc.search("pre").each do |pre|
#  	  pre.replace Pygments.highlight(pre.text.rstrip, lexer: pre.children.attribute("class").value)
#  	end
#  	doc.to_s
#  end

  def markdown( text )
    html_render = HtmlWithPygments.new( hard_wrap: true, filter_html: true )
    markdown = Redcarpet::Markdown.new( html_render,
                                      autolink: true,
                                      fenced_code_blocks: true,
                                      space_after_headers: true,
                                      tables: true,
                                      no_intra_emphasis: true,
                                      strikethrough: true )
    return markdown.render( text ).html_safe
  end

  class HtmlWithPygments < Redcarpet::Render::HTML
    def block_code( code, language )
      Pygments.highlight( code, lexer: language, options: { encoding: 'utf-8' } )
    end
  end

end
