# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configurable properties of an object type.
  class DataIntegration::Models::ConfigParameterDefinition
    # @return [OCI::DataIntegration::Models::BaseType]
    attr_accessor :parameter_type

    # This object represents the configurable properties for an object type.
    # @return [String]
    attr_accessor :parameter_name

    # A user defined description for the object.
    # @return [String]
    attr_accessor :description

    # The default value for the parameter.
    # @return [Object]
    attr_accessor :default_value

    # The parameter class field name.
    # @return [String]
    attr_accessor :class_field_name

    # Specifies whether the parameter is static or not.
    # @return [BOOLEAN]
    attr_accessor :is_static

    # Specifies whether the parameter is a class field or not.
    # @return [BOOLEAN]
    attr_accessor :is_class_field_value

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'parameter_type': :'parameterType',
        'parameter_name': :'parameterName',
        'description': :'description',
        'default_value': :'defaultValue',
        'class_field_name': :'classFieldName',
        'is_static': :'isStatic',
        'is_class_field_value': :'isClassFieldValue'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'parameter_type': :'OCI::DataIntegration::Models::BaseType',
        'parameter_name': :'String',
        'description': :'String',
        'default_value': :'Object',
        'class_field_name': :'String',
        'is_static': :'BOOLEAN',
        'is_class_field_value': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::DataIntegration::Models::BaseType] :parameter_type The value to assign to the {#parameter_type} property
    # @option attributes [String] :parameter_name The value to assign to the {#parameter_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Object] :default_value The value to assign to the {#default_value} property
    # @option attributes [String] :class_field_name The value to assign to the {#class_field_name} property
    # @option attributes [BOOLEAN] :is_static The value to assign to the {#is_static} property
    # @option attributes [BOOLEAN] :is_class_field_value The value to assign to the {#is_class_field_value} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.parameter_type = attributes[:'parameterType'] if attributes[:'parameterType']

      raise 'You cannot provide both :parameterType and :parameter_type' if attributes.key?(:'parameterType') && attributes.key?(:'parameter_type')

      self.parameter_type = attributes[:'parameter_type'] if attributes[:'parameter_type']

      self.parameter_name = attributes[:'parameterName'] if attributes[:'parameterName']

      raise 'You cannot provide both :parameterName and :parameter_name' if attributes.key?(:'parameterName') && attributes.key?(:'parameter_name')

      self.parameter_name = attributes[:'parameter_name'] if attributes[:'parameter_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.default_value = attributes[:'defaultValue'] if attributes[:'defaultValue']

      raise 'You cannot provide both :defaultValue and :default_value' if attributes.key?(:'defaultValue') && attributes.key?(:'default_value')

      self.default_value = attributes[:'default_value'] if attributes[:'default_value']

      self.class_field_name = attributes[:'classFieldName'] if attributes[:'classFieldName']

      raise 'You cannot provide both :classFieldName and :class_field_name' if attributes.key?(:'classFieldName') && attributes.key?(:'class_field_name')

      self.class_field_name = attributes[:'class_field_name'] if attributes[:'class_field_name']

      self.is_static = attributes[:'isStatic'] unless attributes[:'isStatic'].nil?

      raise 'You cannot provide both :isStatic and :is_static' if attributes.key?(:'isStatic') && attributes.key?(:'is_static')

      self.is_static = attributes[:'is_static'] unless attributes[:'is_static'].nil?

      self.is_class_field_value = attributes[:'isClassFieldValue'] unless attributes[:'isClassFieldValue'].nil?

      raise 'You cannot provide both :isClassFieldValue and :is_class_field_value' if attributes.key?(:'isClassFieldValue') && attributes.key?(:'is_class_field_value')

      self.is_class_field_value = attributes[:'is_class_field_value'] unless attributes[:'is_class_field_value'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        parameter_type == other.parameter_type &&
        parameter_name == other.parameter_name &&
        description == other.description &&
        default_value == other.default_value &&
        class_field_name == other.class_field_name &&
        is_static == other.is_static &&
        is_class_field_value == other.is_class_field_value
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
      [parameter_type, parameter_name, description, default_value, class_field_name, is_static, is_class_field_value].hash
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
