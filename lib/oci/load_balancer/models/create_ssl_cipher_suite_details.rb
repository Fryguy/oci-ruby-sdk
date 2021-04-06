# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration details of an SSL cipher suite.
  #
  # The algorithms that compose a cipher suite help you secure Transport Layer Security (TLS) or Secure Socket Layer
  # (SSL) network connections. A cipher suite defines the list of security algorithms your load balancer uses to
  # negotiate with peers while sending and receiving information. The cipher suites you use affect the security
  # level, performance, and compatibility of your data traffic.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  # Oracle created the following predefined cipher suites that you can specify when you define a resource's
  # [SSL configuration](https://docs.cloud.oracle.com/api/#/en/loadbalancer/20170115/datatypes/SSLConfigurationDetails). You can [create custom
  # cipher suites](https://docs.cloud.oracle.com/api/#/en/loadbalancer/20170115/SSLCipherSuite/CreateSSLCipherSuite) if the predefined cipher
  # suites do not meet your requirements.
  #
  #
  # *  __oci-default-ssl-cipher-suite-v1__
  #
  #         \"DHE-RSA-AES128-GCM-SHA256\"
  #         \"DHE-RSA-AES128-SHA256\"
  #         \"DHE-RSA-AES256-GCM-SHA384\"
  #         \"DHE-RSA-AES256-SHA256\"
  #         \"ECDHE-RSA-AES128-GCM-SHA256\"
  #         \"ECDHE-RSA-AES128-SHA256\"
  #         \"ECDHE-RSA-AES256-GCM-SHA384\"
  #         \"ECDHE-RSA-AES256-SHA384\"
  #
  # *  __oci-modern-ssl-cipher-suite-v1__
  #
  #         \"AES128-GCM-SHA256\"
  #         \"AES128-SHA256\"
  #         \"AES256-GCM-SHA384\"
  #         \"AES256-SHA256\"
  #         \"DHE-RSA-AES128-GCM-SHA256\"
  #         \"DHE-RSA-AES128-SHA256\"
  #         \"DHE-RSA-AES256-GCM-SHA384\"
  #         \"DHE-RSA-AES256-SHA256\"
  #         \"ECDHE-ECDSA-AES128-GCM-SHA256\"
  #         \"ECDHE-ECDSA-AES128-SHA256\"
  #         \"ECDHE-ECDSA-AES256-GCM-SHA384\"
  #         \"ECDHE-ECDSA-AES256-SHA384\"
  #         \"ECDHE-RSA-AES128-GCM-SHA256\"
  #         \"ECDHE-RSA-AES128-SHA256\"
  #         \"ECDHE-RSA-AES256-GCM-SHA384\"
  #         \"ECDHE-RSA-AES256-SHA384\"
  #
  # *  __oci-compatible-ssl-cipher-suite-v1__
  #
  #         \"AES128-GCM-SHA256\"
  #         \"AES128-SHA\"
  #         \"AES128-SHA256\"
  #         \"AES256-GCM-SHA384\"
  #         \"AES256-SHA\"
  #         \"AES256-SHA256\"
  #         \"DHE-RSA-AES128-GCM-SHA256\"
  #         \"DHE-RSA-AES128-SHA256\"
  #         \"DHE-RSA-AES256-GCM-SHA384\"
  #         \"DHE-RSA-AES256-SHA256\"
  #         \"ECDHE-ECDSA-AES128-GCM-SHA256\"
  #         \"ECDHE-ECDSA-AES128-SHA\"
  #         \"ECDHE-ECDSA-AES128-SHA256\"
  #         \"ECDHE-ECDSA-AES256-GCM-SHA384\"
  #         \"ECDHE-ECDSA-AES256-SHA\"
  #         \"ECDHE-ECDSA-AES256-SHA384\"
  #         \"ECDHE-RSA-AES128-GCM-SHA256\"
  #         \"ECDHE-RSA-AES128-SHA\"
  #         \"ECDHE-RSA-AES128-SHA256\"
  #         \"ECDHE-RSA-AES256-GCM-SHA384\"
  #         \"ECDHE-RSA-AES256-SHA\"
  #         \"ECDHE-RSA-AES256-SHA384\"
  #
  # *  __oci-wider-compatible-ssl-cipher-suite-v1__
  #
  #         \"AES128-GCM-SHA256\"
  #         \"AES128-SHA\"
  #         \"AES128-SHA256\"
  #         \"AES256-GCM-SHA384\"
  #         \"AES256-SHA\"
  #         \"AES256-SHA256\"
  #         \"CAMELLIA128-SHA\"
  #         \"CAMELLIA256-SHA\"
  #         \"DES-CBC3-SHA\"
  #         \"DH-DSS-AES128-GCM-SHA256\"
  #         \"DH-DSS-AES128-SHA\"
  #         \"DH-DSS-AES128-SHA256\"
  #         \"DH-DSS-AES256-GCM-SHA384\"
  #         \"DH-DSS-AES256-SHA\"
  #         \"DH-DSS-AES256-SHA256\"
  #         \"DH-DSS-CAMELLIA128-SHA\"
  #         \"DH-DSS-CAMELLIA256-SHA\"
  #         \"DH-DSS-DES-CBC3-SHAv\"
  #         \"DH-DSS-SEED-SHA\"
  #         \"DH-RSA-AES128-GCM-SHA256\"
  #         \"DH-RSA-AES128-SHA\"
  #         \"DH-RSA-AES128-SHA256\"
  #         \"DH-RSA-AES256-GCM-SHA384\"
  #         \"DH-RSA-AES256-SHA\"
  #         \"DH-RSA-AES256-SHA256\"
  #         \"DH-RSA-CAMELLIA128-SHA\"
  #         \"DH-RSA-CAMELLIA256-SHA\"
  #         \"DH-RSA-DES-CBC3-SHA\"
  #         \"DH-RSA-SEED-SHA\"
  #         \"DHE-DSS-AES128-GCM-SHA256\"
  #         \"DHE-DSS-AES128-SHA\"
  #         \"DHE-DSS-AES128-SHA256\"
  #         \"DHE-DSS-AES256-GCM-SHA384\"
  #         \"DHE-DSS-AES256-SHA\"
  #         \"DHE-DSS-AES256-SHA256\"
  #         \"DHE-DSS-CAMELLIA128-SHA\"
  #         \"DHE-DSS-CAMELLIA256-SHA\"
  #         \"DHE-DSS-DES-CBC3-SHA\"
  #         \"DHE-DSS-SEED-SHA\"
  #         \"DHE-RSA-AES128-GCM-SHA256\"
  #         \"DHE-RSA-AES128-SHA\"
  #         \"DHE-RSA-AES128-SHA256\"
  #         \"DHE-RSA-AES256-GCM-SHA384\"
  #         \"DHE-RSA-AES256-SHA\"
  #         \"DHE-RSA-AES256-SHA256\"
  #         \"DHE-RSA-CAMELLIA128-SHA\"
  #         \"DHE-RSA-CAMELLIA256-SHA\"
  #         \"DHE-RSA-DES-CBC3-SHA\"
  #         \"DHE-RSA-SEED-SHA\"
  #         \"ECDH-ECDSA-AES128-GCM-SHA256\"
  #         \"ECDH-ECDSA-AES128-SHA\"
  #         \"ECDH-ECDSA-AES128-SHA256\"
  #         \"ECDH-ECDSA-AES256-GCM-SHA384\"
  #         \"ECDH-ECDSA-AES256-SHA\"
  #         \"ECDH-ECDSA-AES256-SHA384\"
  #         \"ECDH-ECDSA-DES-CBC3-SHA\"
  #         \"ECDH-ECDSA-RC4-SHA\"
  #         \"ECDH-RSA-AES128-GCM-SHA256\"
  #         \"ECDH-RSA-AES128-SHA\"
  #         \"ECDH-RSA-AES128-SHA256\"
  #         \"ECDH-RSA-AES256-GCM-SHA384\"
  #         \"ECDH-RSA-AES256-SHA\"
  #         \"ECDH-RSA-AES256-SHA384\"
  #         \"ECDH-RSA-DES-CBC3-SHA\"
  #         \"ECDH-RSA-RC4-SHA\"
  #         \"ECDHE-ECDSA-AES128-GCM-SHA256\"
  #         \"ECDHE-ECDSA-AES128-SHA\"
  #         \"ECDHE-ECDSA-AES128-SHA256\"
  #         \"ECDHE-ECDSA-AES256-GCM-SHA384\"
  #         \"ECDHE-ECDSA-AES256-SHA\"
  #         \"ECDHE-ECDSA-AES256-SHA384\"
  #         \"ECDHE-ECDSA-DES-CBC3-SHA\"
  #         \"ECDHE-ECDSA-RC4-SHA\"
  #         \"ECDHE-RSA-AES128-GCM-SHA256\"
  #         \"ECDHE-RSA-AES128-SHA\"
  #         \"ECDHE-RSA-AES128-SHA256\"
  #         \"ECDHE-RSA-AES256-GCM-SHA384\"
  #         \"ECDHE-RSA-AES256-SHA\"
  #         \"ECDHE-RSA-AES256-SHA384\"
  #         \"ECDHE-RSA-DES-CBC3-SHA\"
  #         \"ECDHE-RSA-RC4-SHA\"
  #         \"IDEA-CBC-SHA\"
  #         \"KRB5-DES-CBC3-MD5\"
  #         \"KRB5-DES-CBC3-SHA\"
  #         \"KRB5-IDEA-CBC-MD5\"
  #         \"KRB5-IDEA-CBC-SHA\"
  #         \"KRB5-RC4-MD5\"
  #         \"KRB5-RC4-SHA\"
  #         \"PSK-3DES-EDE-CBC-SHA\"
  #         \"PSK-AES128-CBC-SHA\"
  #         \"PSK-AES256-CBC-SHA\"
  #         \"PSK-RC4-SHA\"
  #         \"RC4-MD5\"
  #         \"RC4-SHA\"
  #         \"SEED-SHA\"
  #
  class LoadBalancer::Models::CreateSSLCipherSuiteDetails
    # **[Required]** A friendly name for the SSL cipher suite. It must be unique and it cannot be changed.
    #
    # **Note:** The name of your user-defined cipher suite must not be the same as any of Oracle's predefined or
    #           reserved SSL cipher suite names:
    #
    # * oci-default-ssl-cipher-suite-v1
    # * oci-modern-ssl-cipher-suite-v1
    # * oci-compatible-ssl-cipher-suite-v1
    # * oci-wider-compatible-ssl-cipher-suite-v1
    # * oci-customized-ssl-cipher-suite
    #
    # example: `example_cipher_suite`
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** A list of SSL ciphers the load balancer must support for HTTPS or SSL connections.
    #
    # The following ciphers are valid values for this property:
    #
    # *  __TLSv1.2 ciphers__
    #
    #         \"AES128-GCM-SHA256\"
    #         \"AES128-SHA256\"
    #         \"AES256-GCM-SHA384\"
    #         \"AES256-SHA256\"
    #         \"DH-DSS-AES128-GCM-SHA256\"
    #         \"DH-DSS-AES128-SHA256\"
    #         \"DH-DSS-AES256-GCM-SHA384\"
    #         \"DH-DSS-AES256-SHA256\"
    #         \"DH-RSA-AES128-GCM-SHA256\"
    #         \"DH-RSA-AES128-SHA256\"
    #         \"DH-RSA-AES256-GCM-SHA384\"
    #         \"DH-RSA-AES256-SHA256\"
    #         \"DHE-DSS-AES128-GCM-SHA256\"
    #         \"DHE-DSS-AES128-SHA256\"
    #         \"DHE-DSS-AES256-GCM-SHA384\"
    #         \"DHE-DSS-AES256-SHA256\"
    #         \"DHE-RSA-AES128-GCM-SHA256\"
    #         \"DHE-RSA-AES128-SHA256\"
    #         \"DHE-RSA-AES256-GCM-SHA384\"
    #         \"DHE-RSA-AES256-SHA256\"
    #         \"ECDH-ECDSA-AES128-GCM-SHA256\"
    #         \"ECDH-ECDSA-AES128-SHA256\"
    #         \"ECDH-ECDSA-AES256-GCM-SHA384\"
    #         \"ECDH-ECDSA-AES256-SHA384\"
    #         \"ECDH-RSA-AES128-GCM-SHA256\"
    #         \"ECDH-RSA-AES128-SHA256\"
    #         \"ECDH-RSA-AES256-GCM-SHA384\"
    #         \"ECDH-RSA-AES256-SHA384\"
    #         \"ECDHE-ECDSA-AES128-GCM-SHA256\"
    #         \"ECDHE-ECDSA-AES128-SHA256\"
    #         \"ECDHE-ECDSA-AES256-GCM-SHA384\"
    #         \"ECDHE-ECDSA-AES256-SHA384\"
    #         \"ECDHE-RSA-AES128-GCM-SHA256\"
    #         \"ECDHE-RSA-AES128-SHA256\"
    #         \"ECDHE-RSA-AES256-GCM-SHA384\"
    #         \"ECDHE-RSA-AES256-SHA384\"
    #
    # *  __TLSv1 ciphers also supported by TLSv1.2__
    #
    #         \"AES128-SHA\"
    #         \"AES256-SHA\"
    #         \"CAMELLIA128-SHA\"
    #         \"CAMELLIA256-SHA\"
    #         \"DES-CBC3-SHA\"
    #         \"DH-DSS-AES128-SHA\"
    #         \"DH-DSS-AES256-SHA\"
    #         \"DH-DSS-CAMELLIA128-SHA\"
    #         \"DH-DSS-CAMELLIA256-SHA\"
    #         \"DH-DSS-DES-CBC3-SHAv\"
    #         \"DH-DSS-SEED-SHA\"
    #         \"DH-RSA-AES128-SHA\"
    #         \"DH-RSA-AES256-SHA\"
    #         \"DH-RSA-CAMELLIA128-SHA\"
    #         \"DH-RSA-CAMELLIA256-SHA\"
    #         \"DH-RSA-DES-CBC3-SHA\"
    #         \"DH-RSA-SEED-SHA\"
    #         \"DHE-DSS-AES128-SHA\"
    #         \"DHE-DSS-AES256-SHA\"
    #         \"DHE-DSS-CAMELLIA128-SHA\"
    #         \"DHE-DSS-CAMELLIA256-SHA\"
    #         \"DHE-DSS-DES-CBC3-SHA\"
    #         \"DHE-DSS-SEED-SHA\"
    #         \"DHE-RSA-AES128-SHA\"
    #         \"DHE-RSA-AES256-SHA\"
    #         \"DHE-RSA-CAMELLIA128-SHA\"
    #         \"DHE-RSA-CAMELLIA256-SHA\"
    #         \"DHE-RSA-DES-CBC3-SHA\"
    #         \"DHE-RSA-SEED-SHA\"
    #         \"ECDH-ECDSA-AES128-SHA\"
    #         \"ECDH-ECDSA-AES256-SHA\"
    #         \"ECDH-ECDSA-DES-CBC3-SHA\"
    #         \"ECDH-ECDSA-RC4-SHA\"
    #         \"ECDH-RSA-AES128-SHA\"
    #         \"ECDH-RSA-AES256-SHA\"
    #         \"ECDH-RSA-DES-CBC3-SHA\"
    #         \"ECDH-RSA-RC4-SHA\"
    #         \"ECDHE-ECDSA-AES128-SHA\"
    #         \"ECDHE-ECDSA-AES256-SHA\"
    #         \"ECDHE-ECDSA-DES-CBC3-SHA\"
    #         \"ECDHE-ECDSA-RC4-SHA\"
    #         \"ECDHE-RSA-AES128-SHA\"
    #         \"ECDHE-RSA-AES256-SHA\"
    #         \"ECDHE-RSA-DES-CBC3-SHA\"
    #         \"ECDHE-RSA-RC4-SHA\"
    #         \"IDEA-CBC-SHA\"
    #         \"KRB5-DES-CBC3-MD5\"
    #         \"KRB5-DES-CBC3-SHA\"
    #         \"KRB5-IDEA-CBC-MD5\"
    #         \"KRB5-IDEA-CBC-SHA\"
    #         \"KRB5-RC4-MD5\"
    #         \"KRB5-RC4-SHA\"
    #         \"PSK-3DES-EDE-CBC-SHA\"
    #         \"PSK-AES128-CBC-SHA\"
    #         \"PSK-AES256-CBC-SHA\"
    #         \"PSK-RC4-SHA\"
    #         \"RC4-MD5\"
    #         \"RC4-SHA\"
    #         \"SEED-SHA\"
    #
    # example: `[\"ECDHE-RSA-AES256-GCM-SHA384\",\"ECDHE-ECDSA-AES256-GCM-SHA384\",\"ECDHE-RSA-AES128-GCM-SHA256\"]`
    #
    # @return [Array<String>]
    attr_accessor :ciphers

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'ciphers': :'ciphers'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'ciphers': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Array<String>] :ciphers The value to assign to the {#ciphers} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.ciphers = attributes[:'ciphers'] if attributes[:'ciphers']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        ciphers == other.ciphers
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
      [name, ciphers].hash
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
