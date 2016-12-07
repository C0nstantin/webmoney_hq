$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "webmoney_hq/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "webmoney_hq"
  s.version     = WebmoneyHq::VERSION
  s.authors     = ["Karataev Konstantin"]
  s.email       = ["karataev.k.a@gmail.com"]
  s.homepage    = "http://hq.webmoney.ru"
  s.summary     = " Summary of WebmoneyHq."
  s.description = " Description of WebmoneyHq."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
end
