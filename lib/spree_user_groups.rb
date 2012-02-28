require 'spree_core'

module SpreeUserGroups
  class Engine < Rails::Engine
    engine_name 'spree_user_groups'

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    initializer "spree.user_groups.register_calculators" do |app|
      app.config.spree.calculators.add_class('user_groups')
      app.config.spree.calculators.user_groups << Spree::Calculator::AdvancedFlatPercent
    end

    config.autoload_paths += %W(#{config.root}/lib #{config.root}/app/models/spree/calculator)
    config.to_prepare &method(:activate).to_proc
  end
end
