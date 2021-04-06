# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The shape configuration for an instance. The shape configuration determines
  # the resources allocated to an instance.
  #
  class Core::Models::InstanceShapeConfig
    # The total number of OCPUs available to the instance.
    #
    # @return [Float]
    attr_accessor :ocpus

    # The total amount of memory available to the instance, in gigabytes.
    #
    # @return [Float]
    attr_accessor :memory_in_gbs

    # A short description of the instance's processor (CPU).
    #
    # @return [String]
    attr_accessor :processor_description

    # The networking bandwidth available to the instance, in gigabits per second.
    #
    # @return [Float]
    attr_accessor :networking_bandwidth_in_gbps

    # The maximum number of VNIC attachments for the instance.
    #
    # @return [Integer]
    attr_accessor :max_vnic_attachments

    # The number of GPUs available to the instance.
    #
    # @return [Integer]
    attr_accessor :gpus

    # A short description of the instance's graphics processing unit (GPU).
    #
    # If the instance does not have any GPUs, this field is `null`.
    #
    # @return [String]
    attr_accessor :gpu_description

    # The number of local disks available to the instance.
    #
    # @return [Integer]
    attr_accessor :local_disks

    # The aggregate size of all local disks, in gigabytes.
    #
    # If the instance does not have any local disks, this field is `null`.
    #
    # @return [Float]
    attr_accessor :local_disks_total_size_in_gbs

    # A short description of the local disks available to this instance.
    #
    # If the instance does not have any local disks, this field is `null`.
    #
    # @return [String]
    attr_accessor :local_disk_description

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'ocpus': :'ocpus',
        'memory_in_gbs': :'memoryInGBs',
        'processor_description': :'processorDescription',
        'networking_bandwidth_in_gbps': :'networkingBandwidthInGbps',
        'max_vnic_attachments': :'maxVnicAttachments',
        'gpus': :'gpus',
        'gpu_description': :'gpuDescription',
        'local_disks': :'localDisks',
        'local_disks_total_size_in_gbs': :'localDisksTotalSizeInGBs',
        'local_disk_description': :'localDiskDescription'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'ocpus': :'Float',
        'memory_in_gbs': :'Float',
        'processor_description': :'String',
        'networking_bandwidth_in_gbps': :'Float',
        'max_vnic_attachments': :'Integer',
        'gpus': :'Integer',
        'gpu_description': :'String',
        'local_disks': :'Integer',
        'local_disks_total_size_in_gbs': :'Float',
        'local_disk_description': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :ocpus The value to assign to the {#ocpus} property
    # @option attributes [Float] :memory_in_gbs The value to assign to the {#memory_in_gbs} property
    # @option attributes [String] :processor_description The value to assign to the {#processor_description} property
    # @option attributes [Float] :networking_bandwidth_in_gbps The value to assign to the {#networking_bandwidth_in_gbps} property
    # @option attributes [Integer] :max_vnic_attachments The value to assign to the {#max_vnic_attachments} property
    # @option attributes [Integer] :gpus The value to assign to the {#gpus} property
    # @option attributes [String] :gpu_description The value to assign to the {#gpu_description} property
    # @option attributes [Integer] :local_disks The value to assign to the {#local_disks} property
    # @option attributes [Float] :local_disks_total_size_in_gbs The value to assign to the {#local_disks_total_size_in_gbs} property
    # @option attributes [String] :local_disk_description The value to assign to the {#local_disk_description} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.ocpus = attributes[:'ocpus'] if attributes[:'ocpus']

      self.memory_in_gbs = attributes[:'memoryInGBs'] if attributes[:'memoryInGBs']

      raise 'You cannot provide both :memoryInGBs and :memory_in_gbs' if attributes.key?(:'memoryInGBs') && attributes.key?(:'memory_in_gbs')

      self.memory_in_gbs = attributes[:'memory_in_gbs'] if attributes[:'memory_in_gbs']

      self.processor_description = attributes[:'processorDescription'] if attributes[:'processorDescription']

      raise 'You cannot provide both :processorDescription and :processor_description' if attributes.key?(:'processorDescription') && attributes.key?(:'processor_description')

      self.processor_description = attributes[:'processor_description'] if attributes[:'processor_description']

      self.networking_bandwidth_in_gbps = attributes[:'networkingBandwidthInGbps'] if attributes[:'networkingBandwidthInGbps']

      raise 'You cannot provide both :networkingBandwidthInGbps and :networking_bandwidth_in_gbps' if attributes.key?(:'networkingBandwidthInGbps') && attributes.key?(:'networking_bandwidth_in_gbps')

      self.networking_bandwidth_in_gbps = attributes[:'networking_bandwidth_in_gbps'] if attributes[:'networking_bandwidth_in_gbps']

      self.max_vnic_attachments = attributes[:'maxVnicAttachments'] if attributes[:'maxVnicAttachments']

      raise 'You cannot provide both :maxVnicAttachments and :max_vnic_attachments' if attributes.key?(:'maxVnicAttachments') && attributes.key?(:'max_vnic_attachments')

      self.max_vnic_attachments = attributes[:'max_vnic_attachments'] if attributes[:'max_vnic_attachments']

      self.gpus = attributes[:'gpus'] if attributes[:'gpus']

      self.gpu_description = attributes[:'gpuDescription'] if attributes[:'gpuDescription']

      raise 'You cannot provide both :gpuDescription and :gpu_description' if attributes.key?(:'gpuDescription') && attributes.key?(:'gpu_description')

      self.gpu_description = attributes[:'gpu_description'] if attributes[:'gpu_description']

      self.local_disks = attributes[:'localDisks'] if attributes[:'localDisks']

      raise 'You cannot provide both :localDisks and :local_disks' if attributes.key?(:'localDisks') && attributes.key?(:'local_disks')

      self.local_disks = attributes[:'local_disks'] if attributes[:'local_disks']

      self.local_disks_total_size_in_gbs = attributes[:'localDisksTotalSizeInGBs'] if attributes[:'localDisksTotalSizeInGBs']

      raise 'You cannot provide both :localDisksTotalSizeInGBs and :local_disks_total_size_in_gbs' if attributes.key?(:'localDisksTotalSizeInGBs') && attributes.key?(:'local_disks_total_size_in_gbs')

      self.local_disks_total_size_in_gbs = attributes[:'local_disks_total_size_in_gbs'] if attributes[:'local_disks_total_size_in_gbs']

      self.local_disk_description = attributes[:'localDiskDescription'] if attributes[:'localDiskDescription']

      raise 'You cannot provide both :localDiskDescription and :local_disk_description' if attributes.key?(:'localDiskDescription') && attributes.key?(:'local_disk_description')

      self.local_disk_description = attributes[:'local_disk_description'] if attributes[:'local_disk_description']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        ocpus == other.ocpus &&
        memory_in_gbs == other.memory_in_gbs &&
        processor_description == other.processor_description &&
        networking_bandwidth_in_gbps == other.networking_bandwidth_in_gbps &&
        max_vnic_attachments == other.max_vnic_attachments &&
        gpus == other.gpus &&
        gpu_description == other.gpu_description &&
        local_disks == other.local_disks &&
        local_disks_total_size_in_gbs == other.local_disks_total_size_in_gbs &&
        local_disk_description == other.local_disk_description
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
      [ocpus, memory_in_gbs, processor_description, networking_bandwidth_in_gbps, max_vnic_attachments, gpus, gpu_description, local_disks, local_disks_total_size_in_gbs, local_disk_description].hash
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
