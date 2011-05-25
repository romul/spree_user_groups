require 'spree_core'
require 'spree_user_groups_hooks'

module SpreeUserGroups
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      
      if File.basename( $0 ) != "rake"
        begin
          UserGroup.register_calculator(Calculator::AdvancedFlatPercent)
          UserGroup.register_calculator(Calculator::PerVariantPricing)
        rescue Exception => e
          $stderr.puts "Error registering promotion calculator #{Calculator::AdvancedFlatPercent}"
        end
        
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
