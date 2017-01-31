module Interactor
  module Contracts
    module Forwarder
      def self.extended(descendant)
        descendant.extend(Forwardable) unless self.using_activesupport?
      end

      def def_delegates_to_context(keys)
        if Forwarder.using_activesupport?
          delegate *keys, to: :context
        else
          def_delegators :context, *keys
        end
      end

      def self.using_activesupport?
        @using_activesupport ||= !!defined?(ActiveSupport)
      end
    end
  end
end
