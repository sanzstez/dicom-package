# -*- encoding: utf-8 -*-
$:.unshift File.expand_path('../lib', __FILE__)

require 'dicom-package/version'

Gem::Specification.new do |s|
  s.name        = 'dicom-package'
  s.version     = DicomPackage::VERSION
  s.platform    = Gem::Platform::RUBY
  s.description = s.summary = 'Middleware that make DICOM params package compatible with rails.'
  s.licenses    = ['MIT']

  s.authors     = ['sanzstez']
  s.email       = ['sanzstez@gmail.com']
  s.homepage    = 'https://github.com/sanzstez/dicom-package'

  s.files        = Dir['LICENSE', 'Rakefile', 'lib/**/*']
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.0'

  s.add_runtime_dependency "rack", ">=1.0.0"

  s.add_development_dependency 'rake'
end
