Gem::Specification.new do |s|
  s.name        = "config_in_a_can"
  s.version     = "0.1"
  s.authors     = ['Marc Berszick']
  s.email       = ['marc.berszick@friendscout24.de']
  s.homepage    = "https://github.com/ "
  s.summary     = "A minimalistic configuration Gem"
  s.description = "Configuration can be simple and convenient, you just have to throw out everything that isn't really needed"

  s.files        = Dir["{lib,test}/**/*"]
  s.require_path = "lib"

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.5"
end
