# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'language_select/version'

Gem::Specification.new do |s|
  s.name        = 'language_select'
  s.version     = LanguageSelect::VERSION
  s.authors     = ['Jacob Eiler']
  s.email       = ['jacob.eiler@apide.com']
  s.homepage    = 'https://github.com/Apide/language_select'
  s.summary     = %q{Language Select Plugin}
  s.description = %q{Provides a simple helper to get an HTML select list of ISO-639-1 languages.  The list of languages is obtained from Wikipedia (http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).}

  s.rubyforge_project = 'language_select'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  s.add_development_dependency 'rspec'
  if RUBY_VERSION < '1.9.3'
    s.add_development_dependency 'actionpack', '~> 3.2.13'
  else
    s.add_development_dependency 'actionpack'
  end
  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'pry'
end
