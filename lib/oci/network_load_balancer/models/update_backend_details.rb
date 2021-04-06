# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration details for updating a backend server.
  class NetworkLoadBalancer::Models::UpdateBackendDetails
    # The load balancing policy weight assigned to the server. Backend servers with a higher weight receive a larger
    # proportion of incoming traffic. For example, a server weighted '3' receives three times the number of new connections
    # as a server weighted '1'.
    # For more information about load balancing policies, see
    # [How Load Balancing Policies Work](https://docs.cloud.oracle.com/Content/Balance/Reference/lbpolicies.htm).
    #
    # Example: `3`
    #
    # @return [Integer]
    attr_accessor :weight

    # Whether the network load balancer should treat this server as a backup unit. If `true`, then the network load balancer forwards no ingress
    # traffic to this backend server unless all other backend servers not marked as \"isBackup\" fail the health check policy.
    #
    # Example: `false`
    #
    # @return [BOOLEAN]
    attr_accessor :is_backup

    # Whether the network load balancer should drain this server. Servers marked \"isDrain\" receive no
    # incoming traffic.
    #
    # Example: `false`
    #
    # @return [BOOLEAN]
    attr_accessor :is_drain

    # Whether the network load balancer should treat this server as offline. Offline servers receive no incoming
    # traffic.
    #
    # Example: `false`
    #
    # @return [BOOLEAN]
    attr_accessor :is_offline

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'weight': :'weight',
        'is_backup': :'isBackup',
        'is_drain': :'isDrain',
        'is_offline': :'isOffline'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'weight': :'Integer',
        'is_backup': :'BOOLEAN',
        'is_drain': :'BOOLEAN',
        'is_offline': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :weight The value to assign to the {#weight} property
    # @option attributes [BOOLEAN] :is_backup The value to assign to the {#is_backup} property
    # @option attributes [BOOLEAN] :is_drain The value to assign to the {#is_drain} property
    # @option attributes [BOOLEAN] :is_offline The value to assign to the {#is_offline} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.weight = attributes[:'weight'] if attributes[:'weight']

      self.is_backup = attributes[:'isBackup'] unless attributes[:'isBackup'].nil?
      self.is_backup = false if is_backup.nil? && !attributes.key?(:'isBackup') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isBackup and :is_backup' if attributes.key?(:'isBackup') && attributes.key?(:'is_backup')

      self.is_backup = attributes[:'is_backup'] unless attributes[:'is_backup'].nil?
      self.is_backup = false if is_backup.nil? && !attributes.key?(:'isBackup') && !attributes.key?(:'is_backup') # rubocop:disable Style/StringLiterals

      self.is_drain = attributes[:'isDrain'] unless attributes[:'isDrain'].nil?
      self.is_drain = false if is_drain.nil? && !attributes.key?(:'isDrain') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isDrain and :is_drain' if attributes.key?(:'isDrain') && attributes.key?(:'is_drain')

      self.is_drain = attributes[:'is_drain'] unless attributes[:'is_drain'].nil?
      self.is_drain = false if is_drain.nil? && !attributes.key?(:'isDrain') && !attributes.key?(:'is_drain') # rubocop:disable Style/StringLiterals

      self.is_offline = attributes[:'isOffline'] unless attributes[:'isOffline'].nil?
      self.is_offline = false if is_offline.nil? && !attributes.key?(:'isOffline') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isOffline and :is_offline' if attributes.key?(:'isOffline') && attributes.key?(:'is_offline')

      self.is_offline = attributes[:'is_offline'] unless attributes[:'is_offline'].nil?
      self.is_offline = false if is_offline.nil? && !attributes.key?(:'isOffline') && !attributes.key?(:'is_offline') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        weight == other.weight &&
        is_backup == other.is_backup &&
        is_drain == other.is_drain &&
        is_offline == other.is_offline
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
      [weight, is_backup, is_drain, is_offline].hash
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
