module ApplicationHelper
  def page_title
    title = "Yae's Room"
    title = @page_title + " - " + title if @page_title
    title
  end

  def description_tag
    description = "プログラミング初心者が綴る成長の記録。Ruby on Railsで作成したブログで備忘録を認めました。"
    description = @description_tag if @description_tag
    description
  end

  def menu_link_to(text, path)
  	link_to_unless_current(text, path) { content_tag(:span, text) }
  end

  def markdown(text)
  	rndr_options = { hard_wrap: true, filter_html: true }
  	options = { tables: true,
  		        autolink: true,
  		        fenced_code_blocks: true,
  		        no_intra_emphasis: true }
  	rndr = Redcarpet::Render::HTML.new(rndr_options)
  	markdown = Redcarpet::Markdown.new(rndr, options)
  	syntax_highlighter(markdown.render(text)).html_safe
  end

  def syntax_highlighter(html)
  	doc = Nokogiri::HTML(html)
  	doc.search("pre").each do |pre|
  	  pre.replace Pygments.highlight(pre.text.rstrip, lexer: pre.children.attribute("class").value)
  	end
  	doc.to_s
  end
end
