module Interactor
  module Contracts
    # Enables a forwarding to context.params to avoid boilerplate code like `context.param`
    module Forwarder
      # Called when the module is extended
      #
      # @api private
      # @param [Module] extended
      # @return [void]
      def self.extended(extended)
        extended.extend(Forwardable) unless Forwarder.using_activesupport?
      end

      # Define delegates from all expectations to context object
      #
      # @api private
      # @params [Array] all attributes keys defined in expects block
      # @return [void]
      def def_delegates_to_context(keys)
        if Forwarder.using_activesupport?
          delegate *keys, to: :context
        else
          def_delegators :context, *keys
        end
      end

      # Checks whether ActiveSupport is being used or not
      #
      # @api private
      # @return [Boolean] whether ActiveSupport is being used or not
      def self.using_activesupport?
        !!defined?(ActiveSupport)
      end
    end
  end
end
