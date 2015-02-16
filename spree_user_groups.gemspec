Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_user_groups'
  s.version     = '3.0.0'
  s.summary     = 'Adds user groups'
  s.description = 'Provides opportunity to add some rules for calculation price depending on the user group'
  s.required_ruby_version = '>= 2.1.2'

  s.author            = 'Roman Smirnov'
  s.email             = 'POMAHC@gmail.com'
  s.homepage          = 'https://github.com/romul/spree_user_groups'
  # s.rubyforge_project = 'actionmailer'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '~> 3.0.0.rc')
  s.add_dependency('spree_auth_devise', '~> 3.0.0.rc')

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'pry-rails', '>= 0.3.0'
end