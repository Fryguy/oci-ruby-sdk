# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'monitor_configuration'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Configuration details for the BROWSER monitor type.
  class ApmSynthetics::Models::BrowserMonitorConfiguration < ApmSynthetics::Models::MonitorConfiguration
    # If certificate validation is enabled, then the call will fail in case of certification errors.
    # @return [BOOLEAN]
    attr_accessor :is_certificate_validation_enabled

    # Verify all the search strings present in response.
    # If any search string is not present in the response, then it will be considered as a failure.
    #
    # @return [Array<OCI::ApmSynthetics::Models::VerifyText>]
    attr_accessor :verify_texts

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'config_type': :'configType',
        'is_failure_retried': :'isFailureRetried',
        'is_certificate_validation_enabled': :'isCertificateValidationEnabled',
        'verify_texts': :'verifyTexts'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'config_type': :'String',
        'is_failure_retried': :'BOOLEAN',
        'is_certificate_validation_enabled': :'BOOLEAN',
        'verify_texts': :'Array<OCI::ApmSynthetics::Models::VerifyText>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_failure_retried The value to assign to the {OCI::ApmSynthetics::Models::MonitorConfiguration#is_failure_retried #is_failure_retried} proprety
    # @option attributes [BOOLEAN] :is_certificate_validation_enabled The value to assign to the {#is_certificate_validation_enabled} property
    # @option attributes [Array<OCI::ApmSynthetics::Models::VerifyText>] :verify_texts The value to assign to the {#verify_texts} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['configType'] = 'BROWSER_CONFIG'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_certificate_validation_enabled = attributes[:'isCertificateValidationEnabled'] unless attributes[:'isCertificateValidationEnabled'].nil?
      self.is_certificate_validation_enabled = true if is_certificate_validation_enabled.nil? && !attributes.key?(:'isCertificateValidationEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isCertificateValidationEnabled and :is_certificate_validation_enabled' if attributes.key?(:'isCertificateValidationEnabled') && attributes.key?(:'is_certificate_validation_enabled')

      self.is_certificate_validation_enabled = attributes[:'is_certificate_validation_enabled'] unless attributes[:'is_certificate_validation_enabled'].nil?
      self.is_certificate_validation_enabled = true if is_certificate_validation_enabled.nil? && !attributes.key?(:'isCertificateValidationEnabled') && !attributes.key?(:'is_certificate_validation_enabled') # rubocop:disable Style/StringLiterals

      self.verify_texts = attributes[:'verifyTexts'] if attributes[:'verifyTexts']

      raise 'You cannot provide both :verifyTexts and :verify_texts' if attributes.key?(:'verifyTexts') && attributes.key?(:'verify_texts')

      self.verify_texts = attributes[:'verify_texts'] if attributes[:'verify_texts']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        config_type == other.config_type &&
        is_failure_retried == other.is_failure_retried &&
        is_certificate_validation_enabled == other.is_certificate_validation_enabled &&
        verify_texts == other.verify_texts
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
      [config_type, is_failure_retried, is_certificate_validation_enabled, verify_texts].hash
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
