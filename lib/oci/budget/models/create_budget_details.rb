# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The create budget details.
  #
  # Client should use 'targetType' & 'targets' to specify the target type and list of targets on which the budget is applied.
  #
  # For backwards compatibility, 'targetCompartmentId' will still be supported for all existing clients.
  # However, this is considered deprecreated and all clients be upgraded to use 'targetType' & 'targets'.
  #
  # Specifying both 'targetCompartmentId' and 'targets' will cause a Bad Request.
  #
  class Budget::Models::CreateBudgetDetails
    RESET_PERIOD_ENUM = [
      RESET_PERIOD_MONTHLY = 'MONTHLY'.freeze
    ].freeze

    TARGET_TYPE_ENUM = [
      TARGET_TYPE_COMPARTMENT = 'COMPARTMENT'.freeze,
      TARGET_TYPE_TAG = 'TAG'.freeze
    ].freeze

    # **[Required]** The OCID of the compartment
    # @return [String]
    attr_accessor :compartment_id

    # This is DEPRECTAED. Set the target compartment id in targets instead.
    #
    # @return [String]
    attr_accessor :target_compartment_id

    # The displayName of the budget.
    # @return [String]
    attr_accessor :display_name

    # The description of the budget.
    # @return [String]
    attr_accessor :description

    # **[Required]** The amount of the budget expressed as a whole number in the currency of the customer's rate card.
    #
    # @return [Float]
    attr_accessor :amount

    # **[Required]** The reset period for the budget.
    #
    # @return [String]
    attr_reader :reset_period

    # The number of days offset from the first day of the month, at which the budget processing period starts. In months that have fewer days than this value, processing will begin on the last day of that month. For example, for a value of 12, processing starts every month on the 12th at midnight.
    # @return [Integer]
    attr_accessor :budget_processing_period_start_offset

    # The type of target on which the budget is applied.
    #
    # @return [String]
    attr_reader :target_type

    # The list of targets on which the budget is applied.
    #   If targetType is \"COMPARTMENT\", targets contains list of compartment OCIDs.
    #   If targetType is \"TAG\", targets contains list of cost tracking tag identifiers in the form of \"{tagNamespace}.{tagKey}.{tagValue}\".
    # Curerntly, the array should contain EXACT ONE item.
    #
    # @return [Array<String>]
    attr_accessor :targets

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'target_compartment_id': :'targetCompartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'amount': :'amount',
        'reset_period': :'resetPeriod',
        'budget_processing_period_start_offset': :'budgetProcessingPeriodStartOffset',
        'target_type': :'targetType',
        'targets': :'targets',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'target_compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'amount': :'Float',
        'reset_period': :'String',
        'budget_processing_period_start_offset': :'Integer',
        'target_type': :'String',
        'targets': :'Array<String>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :target_compartment_id The value to assign to the {#target_compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Float] :amount The value to assign to the {#amount} property
    # @option attributes [String] :reset_period The value to assign to the {#reset_period} property
    # @option attributes [Integer] :budget_processing_period_start_offset The value to assign to the {#budget_processing_period_start_offset} property
    # @option attributes [String] :target_type The value to assign to the {#target_type} property
    # @option attributes [Array<String>] :targets The value to assign to the {#targets} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.target_compartment_id = attributes[:'targetCompartmentId'] if attributes[:'targetCompartmentId']

      raise 'You cannot provide both :targetCompartmentId and :target_compartment_id' if attributes.key?(:'targetCompartmentId') && attributes.key?(:'target_compartment_id')

      self.target_compartment_id = attributes[:'target_compartment_id'] if attributes[:'target_compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.amount = attributes[:'amount'] if attributes[:'amount']

      self.reset_period = attributes[:'resetPeriod'] if attributes[:'resetPeriod']

      raise 'You cannot provide both :resetPeriod and :reset_period' if attributes.key?(:'resetPeriod') && attributes.key?(:'reset_period')

      self.reset_period = attributes[:'reset_period'] if attributes[:'reset_period']

      self.budget_processing_period_start_offset = attributes[:'budgetProcessingPeriodStartOffset'] if attributes[:'budgetProcessingPeriodStartOffset']

      raise 'You cannot provide both :budgetProcessingPeriodStartOffset and :budget_processing_period_start_offset' if attributes.key?(:'budgetProcessingPeriodStartOffset') && attributes.key?(:'budget_processing_period_start_offset')

      self.budget_processing_period_start_offset = attributes[:'budget_processing_period_start_offset'] if attributes[:'budget_processing_period_start_offset']

      self.target_type = attributes[:'targetType'] if attributes[:'targetType']
      self.target_type = "COMPARTMENT" if target_type.nil? && !attributes.key?(:'targetType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :targetType and :target_type' if attributes.key?(:'targetType') && attributes.key?(:'target_type')

      self.target_type = attributes[:'target_type'] if attributes[:'target_type']
      self.target_type = "COMPARTMENT" if target_type.nil? && !attributes.key?(:'targetType') && !attributes.key?(:'target_type') # rubocop:disable Style/StringLiterals

      self.targets = attributes[:'targets'] if attributes[:'targets']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] reset_period Object to be assigned
    def reset_period=(reset_period)
      raise "Invalid value for 'reset_period': this must be one of the values in RESET_PERIOD_ENUM." if reset_period && !RESET_PERIOD_ENUM.include?(reset_period)

      @reset_period = reset_period
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] target_type Object to be assigned
    def target_type=(target_type)
      raise "Invalid value for 'target_type': this must be one of the values in TARGET_TYPE_ENUM." if target_type && !TARGET_TYPE_ENUM.include?(target_type)

      @target_type = target_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        target_compartment_id == other.target_compartment_id &&
        display_name == other.display_name &&
        description == other.description &&
        amount == other.amount &&
        reset_period == other.reset_period &&
        budget_processing_period_start_offset == other.budget_processing_period_start_offset &&
        target_type == other.target_type &&
        targets == other.targets &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines

    # @see the `==` method
    # @param [Object] other the other object to be compared
    def eql?(other)
      self == other
    end

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [compartment_id, target_compartment_id, display_name, description, amount, reset_period, budget_processing_period_start_offset, target_type, targets, freeform_tags, defined_tags].hash
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # rubocop:disable Metrics/AbcSize, Layout/EmptyLines


    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)

      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            public_method("#{key}=").call(
              attributes[self.class.attribute_map[key]]
                .map { |v| OCI::Internal::Util.convert_to_type(Regexp.last_match(1), v) }
            )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          public_method("#{key}=").call(
            OCI::Internal::Util.convert_to_type(type, attributes[self.class.attribute_map[key]])
          )
        end
        # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end
    # rubocop:enable Metrics/AbcSize, Layout/EmptyLines

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = public_method(attr).call
        next if value.nil? && !instance_variable_defined?("@#{attr}")

        hash[param] = _to_hash(value)
      end
      hash
    end

    private

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
