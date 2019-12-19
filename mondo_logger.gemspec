require 'date'

Gem::Specification.new do |s|
  s.name        = 'mondo_logger'
  s.version     = "#{ENV['GEM_VERSION']}.#{ENV['BUILD_ID']}"
  s.date        = "#{DateTime.now.strftime("%Y-%m-%d")}"
  s.summary     = "Logging functionality!"
  s.description = "A simple logger class"
  s.authors     = ["Mondoshivan"]
  s.email       = "#{ENV['EMAIL']}"
  s.files       = Dir['lib/**/*.rb']
  s.homepage    =
    'https://github.com/mondoshivan/mondo_logger.git'
  s.license       = 'MIT'
end