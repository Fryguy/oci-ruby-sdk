# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Representation of a job definition Resource. Job definitions define the harvest scope and includes the list of
  # objects to be harvested along with a schedule. The list of objects is usually specified through a combination of
  # object type, regular expressions, or specific names of objects and a sample size for the data harvested.
  #
  class DataCatalog::Models::CreateJobDefinitionDetails
    JOB_TYPE_ENUM = [
      JOB_TYPE_HARVEST = 'HARVEST'.freeze,
      JOB_TYPE_PROFILING = 'PROFILING'.freeze,
      JOB_TYPE_SAMPLING = 'SAMPLING'.freeze,
      JOB_TYPE_PREVIEW = 'PREVIEW'.freeze,
      JOB_TYPE_IMPORT = 'IMPORT'.freeze,
      JOB_TYPE_EXPORT = 'EXPORT'.freeze,
      JOB_TYPE_IMPORT_GLOSSARY = 'IMPORT_GLOSSARY'.freeze,
      JOB_TYPE_EXPORT_GLOSSARY = 'EXPORT_GLOSSARY'.freeze,
      JOB_TYPE_INTERNAL = 'INTERNAL'.freeze,
      JOB_TYPE_PURGE = 'PURGE'.freeze,
      JOB_TYPE_IMMEDIATE = 'IMMEDIATE'.freeze,
      JOB_TYPE_SCHEDULED = 'SCHEDULED'.freeze,
      JOB_TYPE_IMMEDIATE_EXECUTION = 'IMMEDIATE_EXECUTION'.freeze,
      JOB_TYPE_SCHEDULED_EXECUTION = 'SCHEDULED_EXECUTION'.freeze,
      JOB_TYPE_SCHEDULED_EXECUTION_INSTANCE = 'SCHEDULED_EXECUTION_INSTANCE'.freeze,
      JOB_TYPE_ASYNC_DELETE = 'ASYNC_DELETE'.freeze
    ].freeze

    # **[Required]** A user-friendly display name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Detailed description of the job definition.
    # @return [String]
    attr_accessor :description

    # **[Required]** Type of the job definition.
    # @return [String]
    attr_reader :job_type

    # Specifies if the job definition is incremental or full.
    # @return [BOOLEAN]
    attr_accessor :is_incremental

    # The key of the data asset for which the job is defined.
    # @return [String]
    attr_accessor :data_asset_key

    # The key of the connection resource to be used for the job.
    # @return [String]
    attr_accessor :connection_key

    # Specify if sample data to be extracted as part of this harvest.
    # @return [BOOLEAN]
    attr_accessor :is_sample_data_extracted

    # Specify the sample data size in MB, specified as number of rows, for this metadata harvest.
    # @return [Integer]
    attr_accessor :sample_data_size_in_mbs

    # A map of maps that contains the properties which are specific to the job type. Each job type
    # definition may define it's set of required and optional properties. The map keys are category names and the
    # values are maps of property name to property value. Every property is contained inside of a category. Most
    # job definitions have required properties within the \"default\" category.
    # Example: `{\"properties\": { \"default\": { \"host\": \"host1\", \"port\": \"1521\", \"database\": \"orcl\"}}}`
    #
    # @return [Hash<String, Hash<String, String>>]
    attr_accessor :properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'description': :'description',
        'job_type': :'jobType',
        'is_incremental': :'isIncremental',
        'data_asset_key': :'dataAssetKey',
        'connection_key': :'connectionKey',
        'is_sample_data_extracted': :'isSampleDataExtracted',
        'sample_data_size_in_mbs': :'sampleDataSizeInMBs',
        'properties': :'properties'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'description': :'String',
        'job_type': :'String',
        'is_incremental': :'BOOLEAN',
        'data_asset_key': :'String',
        'connection_key': :'String',
        'is_sample_data_extracted': :'BOOLEAN',
        'sample_data_size_in_mbs': :'Integer',
        'properties': :'Hash<String, Hash<String, String>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :job_type The value to assign to the {#job_type} property
    # @option attributes [BOOLEAN] :is_incremental The value to assign to the {#is_incremental} property
    # @option attributes [String] :data_asset_key The value to assign to the {#data_asset_key} property
    # @option attributes [String] :connection_key The value to assign to the {#connection_key} property
    # @option attributes [BOOLEAN] :is_sample_data_extracted The value to assign to the {#is_sample_data_extracted} property
    # @option attributes [Integer] :sample_data_size_in_mbs The value to assign to the {#sample_data_size_in_mbs} property
    # @option attributes [Hash<String, Hash<String, String>>] :properties The value to assign to the {#properties} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.job_type = attributes[:'jobType'] if attributes[:'jobType']

      raise 'You cannot provide both :jobType and :job_type' if attributes.key?(:'jobType') && attributes.key?(:'job_type')

      self.job_type = attributes[:'job_type'] if attributes[:'job_type']

      self.is_incremental = attributes[:'isIncremental'] unless attributes[:'isIncremental'].nil?
      self.is_incremental = false if is_incremental.nil? && !attributes.key?(:'isIncremental') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isIncremental and :is_incremental' if attributes.key?(:'isIncremental') && attributes.key?(:'is_incremental')

      self.is_incremental = attributes[:'is_incremental'] unless attributes[:'is_incremental'].nil?
      self.is_incremental = false if is_incremental.nil? && !attributes.key?(:'isIncremental') && !attributes.key?(:'is_incremental') # rubocop:disable Style/StringLiterals

      self.data_asset_key = attributes[:'dataAssetKey'] if attributes[:'dataAssetKey']

      raise 'You cannot provide both :dataAssetKey and :data_asset_key' if attributes.key?(:'dataAssetKey') && attributes.key?(:'data_asset_key')

      self.data_asset_key = attributes[:'data_asset_key'] if attributes[:'data_asset_key']

      self.connection_key = attributes[:'connectionKey'] if attributes[:'connectionKey']

      raise 'You cannot provide both :connectionKey and :connection_key' if attributes.key?(:'connectionKey') && attributes.key?(:'connection_key')

      self.connection_key = attributes[:'connection_key'] if attributes[:'connection_key']

      self.is_sample_data_extracted = attributes[:'isSampleDataExtracted'] unless attributes[:'isSampleDataExtracted'].nil?
      self.is_sample_data_extracted = true if is_sample_data_extracted.nil? && !attributes.key?(:'isSampleDataExtracted') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSampleDataExtracted and :is_sample_data_extracted' if attributes.key?(:'isSampleDataExtracted') && attributes.key?(:'is_sample_data_extracted')

      self.is_sample_data_extracted = attributes[:'is_sample_data_extracted'] unless attributes[:'is_sample_data_extracted'].nil?
      self.is_sample_data_extracted = true if is_sample_data_extracted.nil? && !attributes.key?(:'isSampleDataExtracted') && !attributes.key?(:'is_sample_data_extracted') # rubocop:disable Style/StringLiterals

      self.sample_data_size_in_mbs = attributes[:'sampleDataSizeInMBs'] if attributes[:'sampleDataSizeInMBs']

      raise 'You cannot provide both :sampleDataSizeInMBs and :sample_data_size_in_mbs' if attributes.key?(:'sampleDataSizeInMBs') && attributes.key?(:'sample_data_size_in_mbs')

      self.sample_data_size_in_mbs = attributes[:'sample_data_size_in_mbs'] if attributes[:'sample_data_size_in_mbs']

      self.properties = attributes[:'properties'] if attributes[:'properties']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] job_type Object to be assigned
    def job_type=(job_type)
      raise "Invalid value for 'job_type': this must be one of the values in JOB_TYPE_ENUM." if job_type && !JOB_TYPE_ENUM.include?(job_type)

      @job_type = job_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        description == other.description &&
        job_type == other.job_type &&
        is_incremental == other.is_incremental &&
        data_asset_key == other.data_asset_key &&
        connection_key == other.connection_key &&
        is_sample_data_extracted == other.is_sample_data_extracted &&
        sample_data_size_in_mbs == other.sample_data_size_in_mbs &&
        properties == other.properties
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
      [display_name, description, job_type, is_incremental, data_asset_key, connection_key, is_sample_data_extracted, sample_data_size_in_mbs, properties].hash
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
