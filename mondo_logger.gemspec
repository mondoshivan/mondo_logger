require 'date'

Gem::Specification.new do |s|
  s.name        = 'mondo_logger'
  s.version     = "#{ENV['GEM_VERSION']}.#{ENV['BUILD_ID']}"
  s.date        = DateTime.now.strftime("%Y-%d-%m")
  s.summary     = "Logging functionality!"
  s.description = "A simple logger class"
  s.authors     = ["Mondoshivan"]
  s.email       = 'mondoshivan@me.com'
  s.files       = ["lib/mondo_logger.rb"]
  s.homepage    =
    'https://github.com/mondoshivan/mondo_logger.git'
  s.license       = 'MIT'
end