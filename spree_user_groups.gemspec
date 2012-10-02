Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_user_groups'
  s.version     = '0.50.1'
  s.summary     = 'Adds user groups'
  s.description = 'Provides opportunity to add some rules for calculation price depending on the user group'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Roman Smirnov'
  s.email             = 'roman@railsdog.com'
  s.homepage          = 'https://github.com/romul/spree_user_groups'
  # s.rubyforge_project = 'actionmailer'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '=1.2')
  s.add_dependency('spree_auth_devise', '>= 1.0.0')
  s.add_dependency("resource_controller","=0.6.6")
end
