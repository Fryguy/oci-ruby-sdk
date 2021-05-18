# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # For use with Oracle Cloud Infrastructure FastConnect. Each
  # {VirtualCircuit} runs on one or
  # more cross-connects or cross-connect groups. A `CrossConnectMappingDetails`
  # contains the properties for an individual cross-connect or cross-connect group
  # associated with a given virtual circuit.
  #
  # The details includes information about the cross-connect or
  # cross-connect group, the VLAN, and the BGP peering session.
  #
  class Core::Models::CrossConnectMappingDetails
    IPV4_BGP_STATUS_ENUM = [
      IPV4_BGP_STATUS_UP = 'UP'.freeze,
      IPV4_BGP_STATUS_DOWN = 'DOWN'.freeze,
      IPV4_BGP_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    IPV6_BGP_STATUS_ENUM = [
      IPV6_BGP_STATUS_UP = 'UP'.freeze,
      IPV6_BGP_STATUS_DOWN = 'DOWN'.freeze,
      IPV6_BGP_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The key for BGP MD5 authentication. Only applicable if your system
    # requires MD5 authentication. If empty or not set (null), that
    # means you don't use BGP MD5 authentication.
    #
    # @return [String]
    attr_accessor :bgp_md5_auth_key

    # The OCID of the cross-connect or cross-connect group for this mapping.
    # Specified by the owner of the cross-connect or cross-connect group (the
    # customer if the customer is colocated with Oracle, or the provider if the
    # customer is connecting via provider).
    #
    # @return [String]
    attr_accessor :cross_connect_or_cross_connect_group_id

    # The BGP IPv4 address for the router on the other end of the BGP session from
    # Oracle. Specified by the owner of that router. If the session goes from Oracle
    # to a customer, this is the BGP IPv4 address of the customer's edge router. If the
    # session goes from Oracle to a provider, this is the BGP IPv4 address of the
    # provider's edge router. Must use a /30 or /31 subnet mask.
    #
    # There's one exception: for a public virtual circuit, Oracle specifies the BGP IPv4 addresses.
    #
    # Example: `10.0.0.18/31`
    #
    # @return [String]
    attr_accessor :customer_bgp_peering_ip

    # The IPv4 address for Oracle's end of the BGP session. Must use a /30 or /31
    # subnet mask. If the session goes from Oracle to a customer's edge router,
    # the customer specifies this information. If the session goes from Oracle to
    # a provider's edge router, the provider specifies this.
    #
    # There's one exception: for a public virtual circuit, Oracle specifies the BGP IPv4 addresses.
    #
    # Example: `10.0.0.19/31`
    #
    # @return [String]
    attr_accessor :oracle_bgp_peering_ip

    # The BGP IPv6 address for the router on the other end of the BGP session from
    # Oracle. Specified by the owner of that router. If the session goes from Oracle
    # to a customer, this is the BGP IPv6 address of the customer's edge router. If the
    # session goes from Oracle to a provider, this is the BGP IPv6 address of the
    # provider's edge router. Only subnet masks from /64 up to /127 are allowed.
    #
    # There's one exception: for a public virtual circuit, Oracle specifies the BGP IPv6 addresses.
    #
    # Example: `2001:db8::1/64`
    #
    # @return [String]
    attr_accessor :customer_bgp_peering_ipv6

    # The IPv6 address for Oracle's end of the BGP session. Only subnet masks from /64 up to /127 are allowed.
    # If the session goes from Oracle to a customer's edge router,
    # the customer specifies this information. If the session goes from Oracle to
    # a provider's edge router, the provider specifies this.
    #
    # There's one exception: for a public virtual circuit, Oracle specifies the BGP IPv6 addresses.
    #
    # Example: `2001:db8::2/64`
    #
    # @return [String]
    attr_accessor :oracle_bgp_peering_ipv6

    # The number of the specific VLAN (on the cross-connect or cross-connect group)
    # that is assigned to this virtual circuit. Specified by the owner of the cross-connect
    # or cross-connect group (the customer if the customer is colocated with Oracle, or
    # the provider if the customer is connecting via provider).
    #
    # Example: `200`
    #
    # @return [Integer]
    attr_accessor :vlan

    # The state of the Ipv4 BGP session.
    # @return [String]
    attr_reader :ipv4_bgp_status

    # The state of the Ipv6 BGP session.
    # @return [String]
    attr_reader :ipv6_bgp_status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'bgp_md5_auth_key': :'bgpMd5AuthKey',
        'cross_connect_or_cross_connect_group_id': :'crossConnectOrCrossConnectGroupId',
        'customer_bgp_peering_ip': :'customerBgpPeeringIp',
        'oracle_bgp_peering_ip': :'oracleBgpPeeringIp',
        'customer_bgp_peering_ipv6': :'customerBgpPeeringIpv6',
        'oracle_bgp_peering_ipv6': :'oracleBgpPeeringIpv6',
        'vlan': :'vlan',
        'ipv4_bgp_status': :'ipv4BgpStatus',
        'ipv6_bgp_status': :'ipv6BgpStatus'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'bgp_md5_auth_key': :'String',
        'cross_connect_or_cross_connect_group_id': :'String',
        'customer_bgp_peering_ip': :'String',
        'oracle_bgp_peering_ip': :'String',
        'customer_bgp_peering_ipv6': :'String',
        'oracle_bgp_peering_ipv6': :'String',
        'vlan': :'Integer',
        'ipv4_bgp_status': :'String',
        'ipv6_bgp_status': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :bgp_md5_auth_key The value to assign to the {#bgp_md5_auth_key} property
    # @option attributes [String] :cross_connect_or_cross_connect_group_id The value to assign to the {#cross_connect_or_cross_connect_group_id} property
    # @option attributes [String] :customer_bgp_peering_ip The value to assign to the {#customer_bgp_peering_ip} property
    # @option attributes [String] :oracle_bgp_peering_ip The value to assign to the {#oracle_bgp_peering_ip} property
    # @option attributes [String] :customer_bgp_peering_ipv6 The value to assign to the {#customer_bgp_peering_ipv6} property
    # @option attributes [String] :oracle_bgp_peering_ipv6 The value to assign to the {#oracle_bgp_peering_ipv6} property
    # @option attributes [Integer] :vlan The value to assign to the {#vlan} property
    # @option attributes [String] :ipv4_bgp_status The value to assign to the {#ipv4_bgp_status} property
    # @option attributes [String] :ipv6_bgp_status The value to assign to the {#ipv6_bgp_status} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.bgp_md5_auth_key = attributes[:'bgpMd5AuthKey'] if attributes[:'bgpMd5AuthKey']

      raise 'You cannot provide both :bgpMd5AuthKey and :bgp_md5_auth_key' if attributes.key?(:'bgpMd5AuthKey') && attributes.key?(:'bgp_md5_auth_key')

      self.bgp_md5_auth_key = attributes[:'bgp_md5_auth_key'] if attributes[:'bgp_md5_auth_key']

      self.cross_connect_or_cross_connect_group_id = attributes[:'crossConnectOrCrossConnectGroupId'] if attributes[:'crossConnectOrCrossConnectGroupId']

      raise 'You cannot provide both :crossConnectOrCrossConnectGroupId and :cross_connect_or_cross_connect_group_id' if attributes.key?(:'crossConnectOrCrossConnectGroupId') && attributes.key?(:'cross_connect_or_cross_connect_group_id')

      self.cross_connect_or_cross_connect_group_id = attributes[:'cross_connect_or_cross_connect_group_id'] if attributes[:'cross_connect_or_cross_connect_group_id']

      self.customer_bgp_peering_ip = attributes[:'customerBgpPeeringIp'] if attributes[:'customerBgpPeeringIp']

      raise 'You cannot provide both :customerBgpPeeringIp and :customer_bgp_peering_ip' if attributes.key?(:'customerBgpPeeringIp') && attributes.key?(:'customer_bgp_peering_ip')

      self.customer_bgp_peering_ip = attributes[:'customer_bgp_peering_ip'] if attributes[:'customer_bgp_peering_ip']

      self.oracle_bgp_peering_ip = attributes[:'oracleBgpPeeringIp'] if attributes[:'oracleBgpPeeringIp']

      raise 'You cannot provide both :oracleBgpPeeringIp and :oracle_bgp_peering_ip' if attributes.key?(:'oracleBgpPeeringIp') && attributes.key?(:'oracle_bgp_peering_ip')

      self.oracle_bgp_peering_ip = attributes[:'oracle_bgp_peering_ip'] if attributes[:'oracle_bgp_peering_ip']

      self.customer_bgp_peering_ipv6 = attributes[:'customerBgpPeeringIpv6'] if attributes[:'customerBgpPeeringIpv6']

      raise 'You cannot provide both :customerBgpPeeringIpv6 and :customer_bgp_peering_ipv6' if attributes.key?(:'customerBgpPeeringIpv6') && attributes.key?(:'customer_bgp_peering_ipv6')

      self.customer_bgp_peering_ipv6 = attributes[:'customer_bgp_peering_ipv6'] if attributes[:'customer_bgp_peering_ipv6']

      self.oracle_bgp_peering_ipv6 = attributes[:'oracleBgpPeeringIpv6'] if attributes[:'oracleBgpPeeringIpv6']

      raise 'You cannot provide both :oracleBgpPeeringIpv6 and :oracle_bgp_peering_ipv6' if attributes.key?(:'oracleBgpPeeringIpv6') && attributes.key?(:'oracle_bgp_peering_ipv6')

      self.oracle_bgp_peering_ipv6 = attributes[:'oracle_bgp_peering_ipv6'] if attributes[:'oracle_bgp_peering_ipv6']

      self.vlan = attributes[:'vlan'] if attributes[:'vlan']

      self.ipv4_bgp_status = attributes[:'ipv4BgpStatus'] if attributes[:'ipv4BgpStatus']

      raise 'You cannot provide both :ipv4BgpStatus and :ipv4_bgp_status' if attributes.key?(:'ipv4BgpStatus') && attributes.key?(:'ipv4_bgp_status')

      self.ipv4_bgp_status = attributes[:'ipv4_bgp_status'] if attributes[:'ipv4_bgp_status']

      self.ipv6_bgp_status = attributes[:'ipv6BgpStatus'] if attributes[:'ipv6BgpStatus']

      raise 'You cannot provide both :ipv6BgpStatus and :ipv6_bgp_status' if attributes.key?(:'ipv6BgpStatus') && attributes.key?(:'ipv6_bgp_status')

      self.ipv6_bgp_status = attributes[:'ipv6_bgp_status'] if attributes[:'ipv6_bgp_status']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ipv4_bgp_status Object to be assigned
    def ipv4_bgp_status=(ipv4_bgp_status)
      # rubocop:disable Style/ConditionalAssignment
      if ipv4_bgp_status && !IPV4_BGP_STATUS_ENUM.include?(ipv4_bgp_status)
        OCI.logger.debug("Unknown value for 'ipv4_bgp_status' [" + ipv4_bgp_status + "]. Mapping to 'IPV4_BGP_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @ipv4_bgp_status = IPV4_BGP_STATUS_UNKNOWN_ENUM_VALUE
      else
        @ipv4_bgp_status = ipv4_bgp_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ipv6_bgp_status Object to be assigned
    def ipv6_bgp_status=(ipv6_bgp_status)
      # rubocop:disable Style/ConditionalAssignment
      if ipv6_bgp_status && !IPV6_BGP_STATUS_ENUM.include?(ipv6_bgp_status)
        OCI.logger.debug("Unknown value for 'ipv6_bgp_status' [" + ipv6_bgp_status + "]. Mapping to 'IPV6_BGP_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @ipv6_bgp_status = IPV6_BGP_STATUS_UNKNOWN_ENUM_VALUE
      else
        @ipv6_bgp_status = ipv6_bgp_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        bgp_md5_auth_key == other.bgp_md5_auth_key &&
        cross_connect_or_cross_connect_group_id == other.cross_connect_or_cross_connect_group_id &&
        customer_bgp_peering_ip == other.customer_bgp_peering_ip &&
        oracle_bgp_peering_ip == other.oracle_bgp_peering_ip &&
        customer_bgp_peering_ipv6 == other.customer_bgp_peering_ipv6 &&
        oracle_bgp_peering_ipv6 == other.oracle_bgp_peering_ipv6 &&
        vlan == other.vlan &&
        ipv4_bgp_status == other.ipv4_bgp_status &&
        ipv6_bgp_status == other.ipv6_bgp_status
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
      [bgp_md5_auth_key, cross_connect_or_cross_connect_group_id, customer_bgp_peering_ip, oracle_bgp_peering_ip, customer_bgp_peering_ipv6, oracle_bgp_peering_ipv6, vlan, ipv4_bgp_status, ipv6_bgp_status].hash
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
