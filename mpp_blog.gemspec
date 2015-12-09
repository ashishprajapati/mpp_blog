$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mpp_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mpp_blog"
  s.version     = MppBlog::VERSION
  s.authors     = ["Ashish Prajapati"]
  s.email       = ["ashishprajapati0404@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MppBlog."
  s.description = "TODO: Description of MppBlog."
  s.license     = "MIT"
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'haml-rails'
  s.add_dependency 'sass-rails', '~> 4.0.0'
  s.add_dependency 'bootstrap-sass-rails'
  s.add_dependency 'coffee-rails', '~> 4.0.0'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'mini_magick'
  s.add_dependency 'open_uri_redirections'
  s.add_dependency 'acts-as-taggable-on', '~> 3.4'
  s.add_dependency 'truncate_html'
  s.add_dependency 'carrierwave'
  s.add_dependency 'kaminari'
  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end
