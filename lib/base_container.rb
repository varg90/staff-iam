# frozen_string_literal: true

class BaseContainer
  extend ::Dry::Core::Container::Mixin

  # Extension of default Registry with extra features.
  # - Allows to register default items, to be overriden freely (option +default: true+).
  # - Enables memoization by default.
  class Registry < ::Dry::Core::Container::Registry
    DEFAULT_OPTIONS = { memoize: true }.freeze

    # Register an item with the container to be resolved later
    #
    # @param [Concurrent::Hash] container
    #   The container
    # @param [Mixed] key
    #   The key to register the container item with (used to resolve)
    # @param [Mixed] item
    #   The item to register with the container
    # @param [Hash] options
    # @option options [Symbol] :call
    #   Whether the item should be called when resolved
    # @option options [Boolean] :default
    #   Whether the item should be registered as default (overridable)
    #
    # @raise [Dry::Core::Container::KeyError]
    #   If a non-default item is already registered with the given key
    #
    # @return [Mixed]
    def call(container, key, item, options)
      # This method is mostly copied verbatim from Dry::Core::Container::Registry.
      # The differences are a check for :default, and merging DEFAULT_OPTIONS.

      key = key.to_s.dup.freeze

      @_mutex.synchronize do
        if container.key?(key) && !container[key].options[:default]
          raise KeyError, "There is already an item registered with the key #{key.inspect}"
        end

        container[key] = factory.call(item, DEFAULT_OPTIONS.merge(options))
      end
    end
  end

  configure do |config|
    config.registry = Registry.new
  end

  # Find all registered items with keys matching the given pattern.
  #
  # @param pattern [Regexp, #===]
  # @return [Array]
  def self.all(pattern)
    keys.filter_map { |key| self[key] if pattern === key }
  end
end
