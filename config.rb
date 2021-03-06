###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/feed.xml", layout: false
page "/sitemap.xml", layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
# which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

activate :directory_indexes
activate :sprockets

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :build_dir, 'build'

# Sitemap
set :url_root, 'https://www.amplehair.com'
activate :search_engine_sitemap

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.permalink = ':title.html'
  blog.name = 'tonic'
  blog.sources = 'posts/{year}-{month}-{day}-{title}.html'
  blog.layout = 'layout'
  blog.summary_length = '150'
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.taglink = "tags/{tag}.html"
  blog.paginate = true
  blog.per_page = 20
  blog.page_link = "page/{num}"
  # blog.year_link = "{year}.html"
end

# Reload the browser automatically whenever files change
configure :development do
  # activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

configure :build do
  activate :minify_css, inline: true
  activate :minify_html
  activate :minify_javascript, inline: true
  activate :imageoptim
  activate :asset_hash
end
