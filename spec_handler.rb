#!/usr/bin/env rspec

spec = File.expand_path('../spec', __FILE__)
$:.unshift(spec) unless $:.include?(spec)

lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

Dir[File.join(spec, '**', '*.rb')].each {|file| require file }
