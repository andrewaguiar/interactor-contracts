require "dry-validation"
require "interactor"
require "interactor/contracts/dsl"
require "interactor/contracts/errors"
require "interactor/contracts/forwarder"

module Interactor
  # Create a contract for your interactor that specifies what it expects as
  # inputs.
  module Contracts
    # Called when the module is included into another class or module
    #
    # @api private
    # @param [Class, Module] descendant the including class or module
    # @return [void]
    def self.included(descendant)
      unless descendant.include?(Interactor)
        fail NotAnInteractor, "#{descendant} does not include `Interactor'"
      end
      descendant.extend(DSL)
      descendant.extend(Forwarder)
    end

    private

    # The Contract to enforce on calls to the Interactor
    #
    # @api private
    # @return [Contract]
    def contract
      self.class.contract
    end

    # Checks for a breach of contract and applies consequences for a breach
    #
    # @api private
    # @param [#call] contracts a callable object
    # @return [void]
    def enforce_contracts(contracts)
      outcome = contracts.call(context)

      unless outcome.success?
        contract.consequences.each do |handler|
          instance_exec(outcome.breaches, &handler)
        end
      end
    end
  end
end
