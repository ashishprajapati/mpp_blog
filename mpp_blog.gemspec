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

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "mysql2"
end
