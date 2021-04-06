# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Contact details for the customer.
  class Cims::Models::Contact
    CONTACT_TYPE_ENUM = [
      CONTACT_TYPE_PRIMARY = 'PRIMARY'.freeze,
      CONTACT_TYPE_ALTERNATE = 'ALTERNATE'.freeze,
      CONTACT_TYPE_SECONDARY = 'SECONDARY'.freeze,
      CONTACT_TYPE_ADMIN = 'ADMIN'.freeze,
      CONTACT_TYPE_MANAGER = 'MANAGER'.freeze,
      CONTACT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The name of the contact person.
    # @return [String]
    attr_accessor :contact_name

    # The email of the contact person.
    # @return [String]
    attr_accessor :contact_email

    # The phone number of the contact person.
    # @return [String]
    attr_accessor :contact_phone

    # The type of contact, such as primary or alternate.
    # @return [String]
    attr_reader :contact_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'contact_name': :'contactName',
        'contact_email': :'contactEmail',
        'contact_phone': :'contactPhone',
        'contact_type': :'contactType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'contact_name': :'String',
        'contact_email': :'String',
        'contact_phone': :'String',
        'contact_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :contact_name The value to assign to the {#contact_name} property
    # @option attributes [String] :contact_email The value to assign to the {#contact_email} property
    # @option attributes [String] :contact_phone The value to assign to the {#contact_phone} property
    # @option attributes [String] :contact_type The value to assign to the {#contact_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.contact_name = attributes[:'contactName'] if attributes[:'contactName']

      raise 'You cannot provide both :contactName and :contact_name' if attributes.key?(:'contactName') && attributes.key?(:'contact_name')

      self.contact_name = attributes[:'contact_name'] if attributes[:'contact_name']

      self.contact_email = attributes[:'contactEmail'] if attributes[:'contactEmail']

      raise 'You cannot provide both :contactEmail and :contact_email' if attributes.key?(:'contactEmail') && attributes.key?(:'contact_email')

      self.contact_email = attributes[:'contact_email'] if attributes[:'contact_email']

      self.contact_phone = attributes[:'contactPhone'] if attributes[:'contactPhone']

      raise 'You cannot provide both :contactPhone and :contact_phone' if attributes.key?(:'contactPhone') && attributes.key?(:'contact_phone')

      self.contact_phone = attributes[:'contact_phone'] if attributes[:'contact_phone']

      self.contact_type = attributes[:'contactType'] if attributes[:'contactType']

      raise 'You cannot provide both :contactType and :contact_type' if attributes.key?(:'contactType') && attributes.key?(:'contact_type')

      self.contact_type = attributes[:'contact_type'] if attributes[:'contact_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] contact_type Object to be assigned
    def contact_type=(contact_type)
      # rubocop:disable Style/ConditionalAssignment
      if contact_type && !CONTACT_TYPE_ENUM.include?(contact_type)
        OCI.logger.debug("Unknown value for 'contact_type' [" + contact_type + "]. Mapping to 'CONTACT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @contact_type = CONTACT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @contact_type = contact_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        contact_name == other.contact_name &&
        contact_email == other.contact_email &&
        contact_phone == other.contact_phone &&
        contact_type == other.contact_type
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
      [contact_name, contact_email, contact_phone, contact_type].hash
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
