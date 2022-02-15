# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the tenancy level global settings in Data Safe.
  #
  class DataSafe::Models::GlobalSettings
    # The paid usage option chosen by the customer admin.
    # @return [BOOLEAN]
    attr_accessor :is_paid_usage

    # The online retention period in months.
    # @return [Integer]
    attr_accessor :online_retention_period

    # The offline retention period in months.
    # @return [Integer]
    attr_accessor :offline_retention_period

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_paid_usage': :'isPaidUsage',
        'online_retention_period': :'onlineRetentionPeriod',
        'offline_retention_period': :'offlineRetentionPeriod'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_paid_usage': :'BOOLEAN',
        'online_retention_period': :'Integer',
        'offline_retention_period': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_paid_usage The value to assign to the {#is_paid_usage} property
    # @option attributes [Integer] :online_retention_period The value to assign to the {#online_retention_period} property
    # @option attributes [Integer] :offline_retention_period The value to assign to the {#offline_retention_period} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_paid_usage = attributes[:'isPaidUsage'] unless attributes[:'isPaidUsage'].nil?
      self.is_paid_usage = false if is_paid_usage.nil? && !attributes.key?(:'isPaidUsage') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPaidUsage and :is_paid_usage' if attributes.key?(:'isPaidUsage') && attributes.key?(:'is_paid_usage')

      self.is_paid_usage = attributes[:'is_paid_usage'] unless attributes[:'is_paid_usage'].nil?
      self.is_paid_usage = false if is_paid_usage.nil? && !attributes.key?(:'isPaidUsage') && !attributes.key?(:'is_paid_usage') # rubocop:disable Style/StringLiterals

      self.online_retention_period = attributes[:'onlineRetentionPeriod'] if attributes[:'onlineRetentionPeriod']

      raise 'You cannot provide both :onlineRetentionPeriod and :online_retention_period' if attributes.key?(:'onlineRetentionPeriod') && attributes.key?(:'online_retention_period')

      self.online_retention_period = attributes[:'online_retention_period'] if attributes[:'online_retention_period']

      self.offline_retention_period = attributes[:'offlineRetentionPeriod'] if attributes[:'offlineRetentionPeriod']

      raise 'You cannot provide both :offlineRetentionPeriod and :offline_retention_period' if attributes.key?(:'offlineRetentionPeriod') && attributes.key?(:'offline_retention_period')

      self.offline_retention_period = attributes[:'offline_retention_period'] if attributes[:'offline_retention_period']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_paid_usage == other.is_paid_usage &&
        online_retention_period == other.online_retention_period &&
        offline_retention_period == other.offline_retention_period
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
      [is_paid_usage, online_retention_period, offline_retention_period].hash
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
