module Moip
  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("#{config.root}/lib/moip_sandbox.rb", __FILE__)
  end
end