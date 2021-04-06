# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The execution output from a command.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class ComputeInstanceAgent::Models::InstanceAgentCommandExecutionOutputContent
    OUTPUT_TYPE_ENUM = [
      OUTPUT_TYPE_TEXT = 'TEXT'.freeze,
      OUTPUT_TYPE_OBJECT_STORAGE_URI = 'OBJECT_STORAGE_URI'.freeze,
      OUTPUT_TYPE_OBJECT_STORAGE_TUPLE = 'OBJECT_STORAGE_TUPLE'.freeze,
      OUTPUT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The output destination type for the command. The following values are supported:
    #
    # - TEXT - the command output is returned as plain text.
    # - OBJECT_STORAGE_URI - the command output is saved to an Object Storage URL.
    # - OBJECT_STORAGE_TUPLE - the command output is saved to an Object Storage bucket.
    #
    # For background information about Object Storage buckets and URLs, see
    # [Overview of Object Storage](https://docs.cloud.oracle.com/Content/Object/Concepts/objectstorageoverview.htm).
    #
    # @return [String]
    attr_reader :output_type

    # **[Required]** The exit code for the command. Exit code `0` indicates success.
    # @return [Integer]
    attr_accessor :exit_code

    # An optional status message that Oracle Cloud Agent can populate for additional troubleshooting.
    #
    # @return [String]
    attr_accessor :message

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'output_type': :'outputType',
        'exit_code': :'exitCode',
        'message': :'message'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'output_type': :'String',
        'exit_code': :'Integer',
        'message': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'outputType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::ComputeInstanceAgent::Models::InstanceAgentCommandExecutionOutputViaTextDetails' if type == 'TEXT'
      return 'OCI::ComputeInstanceAgent::Models::InstanceAgentCommandExecutionOutputViaObjectStorageUriDetails' if type == 'OBJECT_STORAGE_URI'
      return 'OCI::ComputeInstanceAgent::Models::InstanceAgentCommandExecutionOutputViaObjectStorageTupleDetails' if type == 'OBJECT_STORAGE_TUPLE'

      # TODO: Log a warning when the subtype is not found.
      'OCI::ComputeInstanceAgent::Models::InstanceAgentCommandExecutionOutputContent'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :output_type The value to assign to the {#output_type} property
    # @option attributes [Integer] :exit_code The value to assign to the {#exit_code} property
    # @option attributes [String] :message The value to assign to the {#message} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.output_type = attributes[:'outputType'] if attributes[:'outputType']

      raise 'You cannot provide both :outputType and :output_type' if attributes.key?(:'outputType') && attributes.key?(:'output_type')

      self.output_type = attributes[:'output_type'] if attributes[:'output_type']

      self.exit_code = attributes[:'exitCode'] if attributes[:'exitCode']

      raise 'You cannot provide both :exitCode and :exit_code' if attributes.key?(:'exitCode') && attributes.key?(:'exit_code')

      self.exit_code = attributes[:'exit_code'] if attributes[:'exit_code']

      self.message = attributes[:'message'] if attributes[:'message']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] output_type Object to be assigned
    def output_type=(output_type)
      # rubocop:disable Style/ConditionalAssignment
      if output_type && !OUTPUT_TYPE_ENUM.include?(output_type)
        OCI.logger.debug("Unknown value for 'output_type' [" + output_type + "]. Mapping to 'OUTPUT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @output_type = OUTPUT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @output_type = output_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        output_type == other.output_type &&
        exit_code == other.exit_code &&
        message == other.message
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
      [output_type, exit_code, message].hash
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
