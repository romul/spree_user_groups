require 'spree_core'

  class Engine < Rails::Engine
    engine_name 'spree_user_groups'

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
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
