# encoding: utf-8
require File.expand_path(File.join('..', 'lib', 'omniauth', 'bonnier_admin_oauth2', 'version'), __FILE__)

Gem::Specification.new do |s|
  s.name        = 'omniauth-bonnier-admin-oauth2'
  s.version     = OmniAuth::BonnierAdminOauth2::VERSION
  s.author       = ["Bonnier Publications - Interactive"]
  s.homepage     = "https://github.com/BenjaminMedia/omniauth-bonnier-admin-oauth2"

  s.description = 'Bonnier Admin OAuth2 strategy for OmniAuth 1.x'
  s.summary     = s.description

  s.add_dependency "omniauth-oauth2"

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'bundler'
  s.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.require_paths = ['lib']
end
