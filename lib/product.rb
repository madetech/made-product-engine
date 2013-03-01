require "product/engine"

module Product
  class Engine < Rails::Engine
    isolate_namespace Product

    initializer :product do
      ActiveAdmin.application.load_paths.unshift Dir[Product::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end
  end

  def self.config(&block)
    @@config ||= Product::Engine::Configuration.new

    yield @@config if block

    return @@config
  end
end
