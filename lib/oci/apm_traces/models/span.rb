# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Definition of a span object.
  #
  class ApmTraces::Models::Span
    # **[Required]** Unique identifier (spanId) for the span.  Note that this field is
    # defined as spanKey in the API to comply with OCI API fields naming conventions.
    # The spanKey maps to the spanId in the APM repository.
    #
    # @return [String]
    attr_accessor :key

    # Unique parent identifier for the span if one exists. For root spans this will be null.
    #
    # @return [String]
    attr_accessor :parent_span_key

    # **[Required]** Unique identifier for the trace.
    #
    # @return [String]
    attr_accessor :trace_key

    # **[Required]** Span start time.  Timestamp when the span was started.
    #
    # @return [DateTime]
    attr_accessor :time_started

    # **[Required]** Span end time.  Timestamp when the span was completed.
    #
    # @return [DateTime]
    attr_accessor :time_ended

    # **[Required]** Total span duration in milliseconds.
    #
    # @return [Integer]
    attr_accessor :duration_in_ms

    # **[Required]** Span name associated with the trace.  This is usually the method or uri of the request.
    #
    # @return [String]
    attr_accessor :operation_name

    # Service name associated with the span.
    #
    # @return [String]
    attr_accessor :service_name

    # Kind associated with the span.
    #
    # @return [String]
    attr_accessor :kind

    # List of tags associated with the span.
    #
    # @return [Array<OCI::ApmTraces::Models::Tag>]
    attr_accessor :tags

    # List of logs associated with the span.
    #
    # @return [Array<OCI::ApmTraces::Models::SpanLogCollection>]
    attr_accessor :logs

    # **[Required]** Indicates if the span has an error
    #
    # @return [BOOLEAN]
    attr_accessor :is_error

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'key',
        'parent_span_key': :'parentSpanKey',
        'trace_key': :'traceKey',
        'time_started': :'timeStarted',
        'time_ended': :'timeEnded',
        'duration_in_ms': :'durationInMs',
        'operation_name': :'operationName',
        'service_name': :'serviceName',
        'kind': :'kind',
        'tags': :'tags',
        'logs': :'logs',
        'is_error': :'isError'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'key': :'String',
        'parent_span_key': :'String',
        'trace_key': :'String',
        'time_started': :'DateTime',
        'time_ended': :'DateTime',
        'duration_in_ms': :'Integer',
        'operation_name': :'String',
        'service_name': :'String',
        'kind': :'String',
        'tags': :'Array<OCI::ApmTraces::Models::Tag>',
        'logs': :'Array<OCI::ApmTraces::Models::SpanLogCollection>',
        'is_error': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :parent_span_key The value to assign to the {#parent_span_key} property
    # @option attributes [String] :trace_key The value to assign to the {#trace_key} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_ended The value to assign to the {#time_ended} property
    # @option attributes [Integer] :duration_in_ms The value to assign to the {#duration_in_ms} property
    # @option attributes [String] :operation_name The value to assign to the {#operation_name} property
    # @option attributes [String] :service_name The value to assign to the {#service_name} property
    # @option attributes [String] :kind The value to assign to the {#kind} property
    # @option attributes [Array<OCI::ApmTraces::Models::Tag>] :tags The value to assign to the {#tags} property
    # @option attributes [Array<OCI::ApmTraces::Models::SpanLogCollection>] :logs The value to assign to the {#logs} property
    # @option attributes [BOOLEAN] :is_error The value to assign to the {#is_error} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.key = attributes[:'key'] if attributes[:'key']

      self.parent_span_key = attributes[:'parentSpanKey'] if attributes[:'parentSpanKey']

      raise 'You cannot provide both :parentSpanKey and :parent_span_key' if attributes.key?(:'parentSpanKey') && attributes.key?(:'parent_span_key')

      self.parent_span_key = attributes[:'parent_span_key'] if attributes[:'parent_span_key']

      self.trace_key = attributes[:'traceKey'] if attributes[:'traceKey']

      raise 'You cannot provide both :traceKey and :trace_key' if attributes.key?(:'traceKey') && attributes.key?(:'trace_key')

      self.trace_key = attributes[:'trace_key'] if attributes[:'trace_key']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_ended = attributes[:'timeEnded'] if attributes[:'timeEnded']

      raise 'You cannot provide both :timeEnded and :time_ended' if attributes.key?(:'timeEnded') && attributes.key?(:'time_ended')

      self.time_ended = attributes[:'time_ended'] if attributes[:'time_ended']

      self.duration_in_ms = attributes[:'durationInMs'] if attributes[:'durationInMs']

      raise 'You cannot provide both :durationInMs and :duration_in_ms' if attributes.key?(:'durationInMs') && attributes.key?(:'duration_in_ms')

      self.duration_in_ms = attributes[:'duration_in_ms'] if attributes[:'duration_in_ms']

      self.operation_name = attributes[:'operationName'] if attributes[:'operationName']

      raise 'You cannot provide both :operationName and :operation_name' if attributes.key?(:'operationName') && attributes.key?(:'operation_name')

      self.operation_name = attributes[:'operation_name'] if attributes[:'operation_name']

      self.service_name = attributes[:'serviceName'] if attributes[:'serviceName']

      raise 'You cannot provide both :serviceName and :service_name' if attributes.key?(:'serviceName') && attributes.key?(:'service_name')

      self.service_name = attributes[:'service_name'] if attributes[:'service_name']

      self.kind = attributes[:'kind'] if attributes[:'kind']

      self.tags = attributes[:'tags'] if attributes[:'tags']

      self.logs = attributes[:'logs'] if attributes[:'logs']

      self.is_error = attributes[:'isError'] unless attributes[:'isError'].nil?

      raise 'You cannot provide both :isError and :is_error' if attributes.key?(:'isError') && attributes.key?(:'is_error')

      self.is_error = attributes[:'is_error'] unless attributes[:'is_error'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        key == other.key &&
        parent_span_key == other.parent_span_key &&
        trace_key == other.trace_key &&
        time_started == other.time_started &&
        time_ended == other.time_ended &&
        duration_in_ms == other.duration_in_ms &&
        operation_name == other.operation_name &&
        service_name == other.service_name &&
        kind == other.kind &&
        tags == other.tags &&
        logs == other.logs &&
        is_error == other.is_error
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
      [key, parent_span_key, trace_key, time_started, time_ended, duration_in_ms, operation_name, service_name, kind, tags, logs, is_error].hash
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
