###
# Page options, layouts, aliases and proxies
###

# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# General configuration
set :layout, "layout"

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# akcms settings
activate :akcms do |akcms|
  akcms.layout = "article"

  akcms.directory_summary_template = "templates/directory_summary_template.html"
  akcms.archive_month_template = "templates/archive_template.html"
  akcms.archive_month_link = 'archives/%<year>04d-%<month>02d.html'
  akcms.tag_template = "templates/tag_template.html"
  akcms.pagination_per_page = 10
  #akcms.series_title_template = "%{name} [%{number}]: %{article_title}" 
end

## other extensions
activate :syntax

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :autolink => true,
  :smartypants => true, :tables => true, :with_toc_data => true


activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.remote = 'git@github.com:atarukodaka/atarukodaka.github.io.git'
  deploy.branch = "master"
  deploy.build_before = true
end

## amazon link
# config.rb
activate :amazon_link do |amazon|
  amazon.associate_tag = "myhoney0079-22"
  amazon.aws_access_key_id = ENV['AWS_ACCESS_KEY']
  amazon.aws_secret_key = ENV['AWS_SECRET_KEY']

  # optional below
  amazon.country = "jp"
  amazon.use_cache = true
  amazon.cache_dir = ".cache/amazon"
end

## youtube
activate :youtube

## google analytics
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-56531446-1'
end
