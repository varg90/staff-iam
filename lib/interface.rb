# frozen_string_literal: true

# Adds ability to call +.new+ on modules,
# allowing to register interfaces as container items, exploding on use.
#
# Also provides +#not_implemented+ method for convenience, with a reasonable message.
module Interface
  class << self
    private

    def included(base)
      super

      return unless base.is_a?(Module)

      base.class_eval do
        def self.new
          o = Object.new
          o.extend(self)
          o
        end
      end
    end
  end

  def not_implemented
    whence = caller_locations(1, 1)[0]
    # `#label` decorates method name with the interface's name, not the implementation's.
    raise NotImplementedError,
          "method #{self.class}##{whence.base_label} is not implemented",
          whence.to_s
  end
end
