require 'date'

Gem::Specification.new do |s|
  s.name        = "#{ENV['GEM_NAME']}"
  s.version     = "#{ENV['GEM_VERSION']}.#{ENV['BUILD_ID']}"
  s.date        = "#{DateTime.now.strftime("%Y-%m-%d")}"
  s.summary     = "#{ENV['GEM_SUMMARY']}"
  s.description = "#{ENV['GEM_DESCRIPTION']}"
  s.authors     = (ENV['GEM_AUTHORS'] || '').split(',').map{|a| a.strip}
  s.email       = "#{ENV['EMAIL']}"
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = "#{ENV['GEM_HOMEPAGE']}"
  s.license     = "#{ENV['GEM_LICENSE']}"
end