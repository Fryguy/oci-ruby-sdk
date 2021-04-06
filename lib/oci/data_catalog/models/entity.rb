# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Data entity details. A representation of data with a set of attributes, normally representing a single
  # business entity. Synonymous with 'table' or 'view' in a database, or a single logical file structure
  # that one or many files may match.
  #
  class DataCatalog::Models::Entity
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_MOVING = 'MOVING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    HARVEST_STATUS_ENUM = [
      HARVEST_STATUS_COMPLETE = 'COMPLETE'.freeze,
      HARVEST_STATUS_ERROR = 'ERROR'.freeze,
      HARVEST_STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      HARVEST_STATUS_DEFERRED = 'DEFERRED'.freeze,
      HARVEST_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique data entity key that is immutable.
    # @return [String]
    attr_accessor :key

    # A user-friendly display name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Detailed description of a data entity.
    # @return [String]
    attr_accessor :description

    # The date and time the data entity was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2019-03-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The last time that any change was made to the data entity. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # OCID of the user who created this object in the data catalog.
    # @return [String]
    attr_accessor :created_by_id

    # OCID of the user who updated this object in the data catalog.
    # @return [String]
    attr_accessor :updated_by_id

    # The current state of the data entity.
    # @return [String]
    attr_reader :lifecycle_state

    # Unique external key of this object in the source system.
    # @return [String]
    attr_accessor :external_key

    # Key of the associated pattern if this is a logical entity.
    # @return [String]
    attr_accessor :pattern_key

    # The expression realized after resolving qualifiers . Used in deriving this logical entity
    # @return [String]
    attr_accessor :realized_expression

    # Last modified timestamp of this object in the external system.
    # @return [DateTime]
    attr_accessor :time_external

    # Time that the data entities status was last updated. An [RFC3339](https://tools.ietf.org/html/rfc3339) formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_status_updated

    # Property that identifies if the object is a physical object (materialized) or virtual/logical object
    # defined on other objects.
    #
    # @return [BOOLEAN]
    attr_accessor :is_logical

    # Property that identifies if an object is a sub object of a physical or materialized parent object.
    # @return [BOOLEAN]
    attr_accessor :is_partition

    # Unique key of the parent data asset.
    # @return [String]
    attr_accessor :data_asset_key

    # Key of the associated folder.
    # @return [String]
    attr_accessor :folder_key

    # Name of the associated folder. This name is harvested from the source data asset when the parent folder for the entiy is harvested.
    # @return [String]
    attr_accessor :folder_name

    # Full path of the data entity.
    # @return [String]
    attr_accessor :path

    # Status of the object as updated by the harvest process.
    # @return [String]
    attr_reader :harvest_status

    # Key of the last harvest process to update this object.
    # @return [String]
    attr_accessor :last_job_key

    # The type of data entity object. Type key's can be found via the '/types' endpoint.
    # @return [String]
    attr_accessor :type_key

    # URI to the data entity instance in the API.
    # @return [String]
    attr_accessor :uri

    # The list of customized properties along with the values for this object
    # @return [Array<OCI::DataCatalog::Models::CustomPropertyGetUsage>]
    attr_accessor :custom_property_members

    # A map of maps that contains the properties which are specific to the entity type. Each entity type
    # definition defines it's set of required and optional properties. The map keys are category names and the
    # values are maps of property name to property value. Every property is contained inside of a category. Most
    # data entities have required properties within the \"default\" category.
    # Example: `{\"properties\": { \"default\": { \"key1\": \"value1\"}}}`
    #
    # @return [Hash<String, Hash<String, String>>]
    attr_accessor :properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'display_name': :'displayName',
        'description': :'description',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'created_by_id': :'createdById',
        'updated_by_id': :'updatedById',
        'lifecycle_state': :'lifecycleState',
        'external_key': :'externalKey',
        'pattern_key': :'patternKey',
        'realized_expression': :'realizedExpression',
        'time_external': :'timeExternal',
        'time_status_updated': :'timeStatusUpdated',
        'is_logical': :'isLogical',
        'is_partition': :'isPartition',
        'data_asset_key': :'dataAssetKey',
        'folder_key': :'folderKey',
        'folder_name': :'folderName',
        'path': :'path',
        'harvest_status': :'harvestStatus',
        'last_job_key': :'lastJobKey',
        'type_key': :'typeKey',
        'uri': :'uri',
        'custom_property_members': :'customPropertyMembers',
        'properties': :'properties'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'display_name': :'String',
        'description': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'created_by_id': :'String',
        'updated_by_id': :'String',
        'lifecycle_state': :'String',
        'external_key': :'String',
        'pattern_key': :'String',
        'realized_expression': :'String',
        'time_external': :'DateTime',
        'time_status_updated': :'DateTime',
        'is_logical': :'BOOLEAN',
        'is_partition': :'BOOLEAN',
        'data_asset_key': :'String',
        'folder_key': :'String',
        'folder_name': :'String',
        'path': :'String',
        'harvest_status': :'String',
        'last_job_key': :'String',
        'type_key': :'String',
        'uri': :'String',
        'custom_property_members': :'Array<OCI::DataCatalog::Models::CustomPropertyGetUsage>',
        'properties': :'Hash<String, Hash<String, String>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :created_by_id The value to assign to the {#created_by_id} property
    # @option attributes [String] :updated_by_id The value to assign to the {#updated_by_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :external_key The value to assign to the {#external_key} property
    # @option attributes [String] :pattern_key The value to assign to the {#pattern_key} property
    # @option attributes [String] :realized_expression The value to assign to the {#realized_expression} property
    # @option attributes [DateTime] :time_external The value to assign to the {#time_external} property
    # @option attributes [DateTime] :time_status_updated The value to assign to the {#time_status_updated} property
    # @option attributes [BOOLEAN] :is_logical The value to assign to the {#is_logical} property
    # @option attributes [BOOLEAN] :is_partition The value to assign to the {#is_partition} property
    # @option attributes [String] :data_asset_key The value to assign to the {#data_asset_key} property
    # @option attributes [String] :folder_key The value to assign to the {#folder_key} property
    # @option attributes [String] :folder_name The value to assign to the {#folder_name} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [String] :harvest_status The value to assign to the {#harvest_status} property
    # @option attributes [String] :last_job_key The value to assign to the {#last_job_key} property
    # @option attributes [String] :type_key The value to assign to the {#type_key} property
    # @option attributes [String] :uri The value to assign to the {#uri} property
    # @option attributes [Array<OCI::DataCatalog::Models::CustomPropertyGetUsage>] :custom_property_members The value to assign to the {#custom_property_members} property
    # @option attributes [Hash<String, Hash<String, String>>] :properties The value to assign to the {#properties} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.created_by_id = attributes[:'createdById'] if attributes[:'createdById']

      raise 'You cannot provide both :createdById and :created_by_id' if attributes.key?(:'createdById') && attributes.key?(:'created_by_id')

      self.created_by_id = attributes[:'created_by_id'] if attributes[:'created_by_id']

      self.updated_by_id = attributes[:'updatedById'] if attributes[:'updatedById']

      raise 'You cannot provide both :updatedById and :updated_by_id' if attributes.key?(:'updatedById') && attributes.key?(:'updated_by_id')

      self.updated_by_id = attributes[:'updated_by_id'] if attributes[:'updated_by_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.external_key = attributes[:'externalKey'] if attributes[:'externalKey']

      raise 'You cannot provide both :externalKey and :external_key' if attributes.key?(:'externalKey') && attributes.key?(:'external_key')

      self.external_key = attributes[:'external_key'] if attributes[:'external_key']

      self.pattern_key = attributes[:'patternKey'] if attributes[:'patternKey']

      raise 'You cannot provide both :patternKey and :pattern_key' if attributes.key?(:'patternKey') && attributes.key?(:'pattern_key')

      self.pattern_key = attributes[:'pattern_key'] if attributes[:'pattern_key']

      self.realized_expression = attributes[:'realizedExpression'] if attributes[:'realizedExpression']

      raise 'You cannot provide both :realizedExpression and :realized_expression' if attributes.key?(:'realizedExpression') && attributes.key?(:'realized_expression')

      self.realized_expression = attributes[:'realized_expression'] if attributes[:'realized_expression']

      self.time_external = attributes[:'timeExternal'] if attributes[:'timeExternal']

      raise 'You cannot provide both :timeExternal and :time_external' if attributes.key?(:'timeExternal') && attributes.key?(:'time_external')

      self.time_external = attributes[:'time_external'] if attributes[:'time_external']

      self.time_status_updated = attributes[:'timeStatusUpdated'] if attributes[:'timeStatusUpdated']

      raise 'You cannot provide both :timeStatusUpdated and :time_status_updated' if attributes.key?(:'timeStatusUpdated') && attributes.key?(:'time_status_updated')

      self.time_status_updated = attributes[:'time_status_updated'] if attributes[:'time_status_updated']

      self.is_logical = attributes[:'isLogical'] unless attributes[:'isLogical'].nil?

      raise 'You cannot provide both :isLogical and :is_logical' if attributes.key?(:'isLogical') && attributes.key?(:'is_logical')

      self.is_logical = attributes[:'is_logical'] unless attributes[:'is_logical'].nil?

      self.is_partition = attributes[:'isPartition'] unless attributes[:'isPartition'].nil?

      raise 'You cannot provide both :isPartition and :is_partition' if attributes.key?(:'isPartition') && attributes.key?(:'is_partition')

      self.is_partition = attributes[:'is_partition'] unless attributes[:'is_partition'].nil?

      self.data_asset_key = attributes[:'dataAssetKey'] if attributes[:'dataAssetKey']

      raise 'You cannot provide both :dataAssetKey and :data_asset_key' if attributes.key?(:'dataAssetKey') && attributes.key?(:'data_asset_key')

      self.data_asset_key = attributes[:'data_asset_key'] if attributes[:'data_asset_key']

      self.folder_key = attributes[:'folderKey'] if attributes[:'folderKey']

      raise 'You cannot provide both :folderKey and :folder_key' if attributes.key?(:'folderKey') && attributes.key?(:'folder_key')

      self.folder_key = attributes[:'folder_key'] if attributes[:'folder_key']

      self.folder_name = attributes[:'folderName'] if attributes[:'folderName']

      raise 'You cannot provide both :folderName and :folder_name' if attributes.key?(:'folderName') && attributes.key?(:'folder_name')

      self.folder_name = attributes[:'folder_name'] if attributes[:'folder_name']

      self.path = attributes[:'path'] if attributes[:'path']

      self.harvest_status = attributes[:'harvestStatus'] if attributes[:'harvestStatus']

      raise 'You cannot provide both :harvestStatus and :harvest_status' if attributes.key?(:'harvestStatus') && attributes.key?(:'harvest_status')

      self.harvest_status = attributes[:'harvest_status'] if attributes[:'harvest_status']

      self.last_job_key = attributes[:'lastJobKey'] if attributes[:'lastJobKey']

      raise 'You cannot provide both :lastJobKey and :last_job_key' if attributes.key?(:'lastJobKey') && attributes.key?(:'last_job_key')

      self.last_job_key = attributes[:'last_job_key'] if attributes[:'last_job_key']

      self.type_key = attributes[:'typeKey'] if attributes[:'typeKey']

      raise 'You cannot provide both :typeKey and :type_key' if attributes.key?(:'typeKey') && attributes.key?(:'type_key')

      self.type_key = attributes[:'type_key'] if attributes[:'type_key']

      self.uri = attributes[:'uri'] if attributes[:'uri']

      self.custom_property_members = attributes[:'customPropertyMembers'] if attributes[:'customPropertyMembers']

      raise 'You cannot provide both :customPropertyMembers and :custom_property_members' if attributes.key?(:'customPropertyMembers') && attributes.key?(:'custom_property_members')

      self.custom_property_members = attributes[:'custom_property_members'] if attributes[:'custom_property_members']

      self.properties = attributes[:'properties'] if attributes[:'properties']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] harvest_status Object to be assigned
    def harvest_status=(harvest_status)
      # rubocop:disable Style/ConditionalAssignment
      if harvest_status && !HARVEST_STATUS_ENUM.include?(harvest_status)
        OCI.logger.debug("Unknown value for 'harvest_status' [" + harvest_status + "]. Mapping to 'HARVEST_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @harvest_status = HARVEST_STATUS_UNKNOWN_ENUM_VALUE
      else
        @harvest_status = harvest_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        display_name == other.display_name &&
        description == other.description &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        created_by_id == other.created_by_id &&
        updated_by_id == other.updated_by_id &&
        lifecycle_state == other.lifecycle_state &&
        external_key == other.external_key &&
        pattern_key == other.pattern_key &&
        realized_expression == other.realized_expression &&
        time_external == other.time_external &&
        time_status_updated == other.time_status_updated &&
        is_logical == other.is_logical &&
        is_partition == other.is_partition &&
        data_asset_key == other.data_asset_key &&
        folder_key == other.folder_key &&
        folder_name == other.folder_name &&
        path == other.path &&
        harvest_status == other.harvest_status &&
        last_job_key == other.last_job_key &&
        type_key == other.type_key &&
        uri == other.uri &&
        custom_property_members == other.custom_property_members &&
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
      [key, display_name, description, time_created, time_updated, created_by_id, updated_by_id, lifecycle_state, external_key, pattern_key, realized_expression, time_external, time_status_updated, is_logical, is_partition, data_asset_key, folder_key, folder_name, path, harvest_status, last_job_key, type_key, uri, custom_property_members, properties].hash
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
