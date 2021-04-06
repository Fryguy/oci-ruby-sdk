# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the properties of a dashboard.
  class ManagementDashboard::Models::ManagementDashboardSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** ID of the dashboard.
    # @return [String]
    attr_accessor :dashboard_id

    # **[Required]** Display name of the dashboard.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Description of the dashboard.
    # @return [String]
    attr_accessor :description

    # **[Required]** OCID of the compartment in which the dashboard resides.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Determines whether the dashboard is an Out-of-the-Box (OOB) dashboard. Note that OOB dashboards are only provided by Oracle and cannot be modified.
    # @return [BOOLEAN]
    attr_accessor :is_oob_dashboard

    # **[Required]** User who created the dashboard.
    # @return [String]
    attr_accessor :created_by

    # **[Required]** Date and time the dashboard was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** User who updated the dashboard.
    # @return [String]
    attr_accessor :updated_by

    # **[Required]** Date and time the dashboard was updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** Version of the metadata.
    # @return [String]
    attr_accessor :metadata_version

    # **[Required]** Screen image of the dashboard.
    # @return [String]
    attr_accessor :screen_image

    # **[Required]** JSON that contains internationalization options.
    # @return [Object]
    attr_accessor :nls

    # **[Required]** Type of dashboard. NORMAL denotes a single dashboard and SET denotes a dashboard set.
    # @return [String]
    attr_accessor :type

    # **[Required]** Current lifecycle state of the dashboard.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'dashboard_id': :'dashboardId',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'is_oob_dashboard': :'isOobDashboard',
        'created_by': :'createdBy',
        'time_created': :'timeCreated',
        'updated_by': :'updatedBy',
        'time_updated': :'timeUpdated',
        'metadata_version': :'metadataVersion',
        'screen_image': :'screenImage',
        'nls': :'nls',
        'type': :'type',
        'lifecycle_state': :'lifecycleState',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'dashboard_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'is_oob_dashboard': :'BOOLEAN',
        'created_by': :'String',
        'time_created': :'DateTime',
        'updated_by': :'String',
        'time_updated': :'DateTime',
        'metadata_version': :'String',
        'screen_image': :'String',
        'nls': :'Object',
        'type': :'String',
        'lifecycle_state': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :dashboard_id The value to assign to the {#dashboard_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :is_oob_dashboard The value to assign to the {#is_oob_dashboard} property
    # @option attributes [String] :created_by The value to assign to the {#created_by} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :updated_by The value to assign to the {#updated_by} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :metadata_version The value to assign to the {#metadata_version} property
    # @option attributes [String] :screen_image The value to assign to the {#screen_image} property
    # @option attributes [Object] :nls The value to assign to the {#nls} property
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.dashboard_id = attributes[:'dashboardId'] if attributes[:'dashboardId']

      raise 'You cannot provide both :dashboardId and :dashboard_id' if attributes.key?(:'dashboardId') && attributes.key?(:'dashboard_id')

      self.dashboard_id = attributes[:'dashboard_id'] if attributes[:'dashboard_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.is_oob_dashboard = attributes[:'isOobDashboard'] unless attributes[:'isOobDashboard'].nil?

      raise 'You cannot provide both :isOobDashboard and :is_oob_dashboard' if attributes.key?(:'isOobDashboard') && attributes.key?(:'is_oob_dashboard')

      self.is_oob_dashboard = attributes[:'is_oob_dashboard'] unless attributes[:'is_oob_dashboard'].nil?

      self.created_by = attributes[:'createdBy'] if attributes[:'createdBy']

      raise 'You cannot provide both :createdBy and :created_by' if attributes.key?(:'createdBy') && attributes.key?(:'created_by')

      self.created_by = attributes[:'created_by'] if attributes[:'created_by']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.updated_by = attributes[:'updatedBy'] if attributes[:'updatedBy']

      raise 'You cannot provide both :updatedBy and :updated_by' if attributes.key?(:'updatedBy') && attributes.key?(:'updated_by')

      self.updated_by = attributes[:'updated_by'] if attributes[:'updated_by']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.metadata_version = attributes[:'metadataVersion'] if attributes[:'metadataVersion']

      raise 'You cannot provide both :metadataVersion and :metadata_version' if attributes.key?(:'metadataVersion') && attributes.key?(:'metadata_version')

      self.metadata_version = attributes[:'metadata_version'] if attributes[:'metadata_version']

      self.screen_image = attributes[:'screenImage'] if attributes[:'screenImage']

      raise 'You cannot provide both :screenImage and :screen_image' if attributes.key?(:'screenImage') && attributes.key?(:'screen_image')

      self.screen_image = attributes[:'screen_image'] if attributes[:'screen_image']

      self.nls = attributes[:'nls'] if attributes[:'nls']

      self.type = attributes[:'type'] if attributes[:'type']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        dashboard_id == other.dashboard_id &&
        display_name == other.display_name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        is_oob_dashboard == other.is_oob_dashboard &&
        created_by == other.created_by &&
        time_created == other.time_created &&
        updated_by == other.updated_by &&
        time_updated == other.time_updated &&
        metadata_version == other.metadata_version &&
        screen_image == other.screen_image &&
        nls == other.nls &&
        type == other.type &&
        lifecycle_state == other.lifecycle_state &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [dashboard_id, display_name, description, compartment_id, is_oob_dashboard, created_by, time_created, updated_by, time_updated, metadata_version, screen_image, nls, type, lifecycle_state, freeform_tags, defined_tags].hash
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
