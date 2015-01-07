module SpreeUserGroups
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_user_groups'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Spree::PermittedAttributes.user_attributes << :user_group_id

      if File.basename( $0 ) != "rake"
        begin
          config.spree.calculators.add_class('user_groups')
          config.spree.calculators.user_groups = [
            Spree::Calculator::AdvancedFlatPercent,
            Spree::Calculator::PerVariantPricing
          ]
        rescue Exception => e
          $stderr.puts "Error registering promotion calculator,#{e.message}"
        end
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end