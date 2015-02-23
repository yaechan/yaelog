# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://yaelog.herokuapp.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add '/member'
  add '/about'
  add '/entries/2'
  add '/entries/3'
  add '/entries/4'
  add '/entries/5'
  add '/entries/6'
  add '/entries/7'
  add '/entries/8'
  add '/entries/9'
  add '/entries/11'
  add '/entries/14'
  add '/entries/15'
  add '/entries/16'
  add '/entries/17'
  add '/entries/18'
  add '/entries/19'
  add '/entries/21'
  add '/entries/22'
  add '/entries/23'
  add '/entries/24'
  add '/entries/25'
  add '/entries/26'
  add '/entries/27'
  add '/entries/28'
  add '/entries/29'
  add '/entries/30'
  add '/entries/31'
  add '/entries/34'
  add '/entries/35'
  add '/entries/36'
  add '/entries/37'
  add '/entries/42'
  add '/entries/43'
  add '/entries/45'
  add '/entries/46'
  add '/entries/47'
  add '/entries/48'
  add '/entries/49'
  add '/entries/50'
  add '/entries/51'
  add '/entries/52'
end
