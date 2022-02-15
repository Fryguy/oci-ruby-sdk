# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'uri'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Manage Oracle Cloud Infrastructure console announcements.
  class AnnouncementsService::AnnouncementSubscriptionClient
    # Client used to make HTTP requests.
    # @return [OCI::ApiClient]
    attr_reader :api_client

    # Fully qualified endpoint URL
    # @return [String]
    attr_reader :endpoint

    # The default retry configuration to apply to all operations in this service client. This can be overridden
    # on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    # will not perform any retries
    # @return [OCI::Retry::RetryConfig]
    attr_reader :retry_config

    # The region, which will usually correspond to a value in {OCI::Regions::REGION_ENUM}.
    # @return [String]
    attr_reader :region

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity


    # Creates a new AnnouncementSubscriptionClient.
    # Notes:
    #   If a config is not specified, then the global OCI.config will be used.
    #
    #   This client is not thread-safe
    #
    #   Either a region or an endpoint must be specified.  If an endpoint is specified, it will be used instead of the
    #     region. A region may be specified in the config or via or the region parameter. If specified in both, then the
    #     region parameter will be used.
    # @param [Config] config A Config object.
    # @param [String] region A region used to determine the service endpoint. This will usually
    #   correspond to a value in {OCI::Regions::REGION_ENUM}, but may be an arbitrary string.
    # @param [String] endpoint The fully qualified endpoint URL
    # @param [OCI::BaseSigner] signer A signer implementation which can be used by this client. If this is not provided then
    #   a signer will be constructed via the provided config. One use case of this parameter is instance principals authentication,
    #   so that the instance principals signer can be provided to the client
    # @param [OCI::ApiClientProxySettings] proxy_settings If your environment requires you to use a proxy server for outgoing HTTP requests
    #   the details for the proxy can be provided in this parameter
    # @param [OCI::Retry::RetryConfig] retry_config The retry configuration for this service client. This represents the default retry configuration to
    #   apply across all operations. This can be overridden on a per-operation basis. The default retry configuration value is `nil`, which means that an operation
    #   will not perform any retries
    def initialize(config: nil, region: nil, endpoint: nil, signer: nil, proxy_settings: nil, retry_config: nil)
      # If the signer is an InstancePrincipalsSecurityTokenSigner or SecurityTokenSigner and no config was supplied (they are self-sufficient signers)
      # then create a dummy config to pass to the ApiClient constructor. If customers wish to create a client which uses instance principals
      # and has config (either populated programmatically or loaded from a file), they must construct that config themselves and then
      # pass it to this constructor.
      #
      # If there is no signer (or the signer is not an instance principals signer) and no config was supplied, this is not valid
      # so try and load the config from the default file.
      config = OCI::Config.validate_and_build_config_with_signer(config, signer)

      signer = OCI::Signer.config_file_auth_builder(config) if signer.nil?

      @api_client = OCI::ApiClient.new(config, signer, proxy_settings: proxy_settings)
      @retry_config = retry_config

      if endpoint
        @endpoint = endpoint + '/20180904'
      else
        region ||= config.region
        region ||= signer.region if signer.respond_to?(:region)
        self.region = region
      end
      logger.info "AnnouncementSubscriptionClient endpoint set to '#{@endpoint}'." if logger
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity

    # Set the region that will be used to determine the service endpoint.
    # This will usually correspond to a value in {OCI::Regions::REGION_ENUM},
    # but may be an arbitrary string.
    def region=(new_region)
      @region = new_region

      raise 'A region must be specified.' unless @region

      @endpoint = OCI::Regions.get_service_endpoint_for_template(@region, 'https://announcements.{region}.oci.{secondLevelDomain}') + '/20180904'
      logger.info "AnnouncementSubscriptionClient endpoint set to '#{@endpoint} from region #{@region}'." if logger
    end

    # @return [Logger] The logger for this client. May be nil.
    def logger
      @api_client.config.logger
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Moves the specified announcement subscription from one compartment to another compartment. When provided, If-Match is checked against ETag values of the resource.
    #
    # This call is subject to an Announcements limit that applies to the total number of requests across all read or write operations. Announcements might throttle this call to reject an otherwise valid request when the total rate of operations exceeds 20 requests per second for a given user. The service might also throttle this call to reject an otherwise valid request when the total rate of operations exceeds 100 requests per second for a given tenancy.
    #
    # @param [String] announcement_subscription_id The OCID of the announcement subscription.
    # @param [OCI::AnnouncementsService::Models::ChangeAnnouncementSubscriptionCompartmentDetails] change_announcement_subscription_compartment_details The compartment information to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The locking version, used for optimistic concurrency control.
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/change_announcement_subscription_compartment.rb.html) to see an example of how to use change_announcement_subscription_compartment API.
    def change_announcement_subscription_compartment(announcement_subscription_id, change_announcement_subscription_compartment_details, opts = {})
      logger.debug 'Calling operation AnnouncementSubscriptionClient#change_announcement_subscription_compartment.' if logger

      raise "Missing the required parameter 'announcement_subscription_id' when calling change_announcement_subscription_compartment." if announcement_subscription_id.nil?
      raise "Missing the required parameter 'change_announcement_subscription_compartment_details' when calling change_announcement_subscription_compartment." if change_announcement_subscription_compartment_details.nil?
      raise "Parameter value for 'announcement_subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(announcement_subscription_id)

      path = '/announcementSubscriptions/{announcementSubscriptionId}/actions/changeCompartment'.sub('{announcementSubscriptionId}', announcement_subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(change_announcement_subscription_compartment_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementSubscriptionClient#change_announcement_subscription_compartment') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new announcement subscription.
    #
    # This call is subject to an Announcements limit that applies to the total number of requests across all read or write operations. Announcements might throttle this call to reject an otherwise valid request when the total rate of operations exceeds 20 requests per second for a given user. The service might also throttle this call to reject an otherwise valid request when the total rate of operations exceeds 100 requests per second for a given tenancy.
    #
    # @param [OCI::AnnouncementsService::Models::CreateAnnouncementSubscriptionDetails] create_announcement_subscription_details Details of the new announcement subscription.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type {OCI::AnnouncementsService::Models::AnnouncementSubscription AnnouncementSubscription}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/create_announcement_subscription.rb.html) to see an example of how to use create_announcement_subscription API.
    def create_announcement_subscription(create_announcement_subscription_details, opts = {})
      logger.debug 'Calling operation AnnouncementSubscriptionClient#create_announcement_subscription.' if logger

      raise "Missing the required parameter 'create_announcement_subscription_details' when calling create_announcement_subscription." if create_announcement_subscription_details.nil?

      path = '/announcementSubscriptions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_announcement_subscription_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementSubscriptionClient#create_announcement_subscription') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AnnouncementsService::Models::AnnouncementSubscription'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Creates a new filter group in the specified announcement subscription.
    #
    # This call is subject to an Announcements limit that applies to the total number of requests across all read or write operations. Announcements might throttle this call to reject an otherwise valid request when the total rate of operations exceeds 20 requests per second for a given user. The service might also throttle this call to reject an otherwise valid request when the total rate of operations exceeds 100 requests per second for a given tenancy.
    #
    # @param [String] announcement_subscription_id The OCID of the announcement subscription.
    # @param [OCI::AnnouncementsService::Models::CreateFilterGroupDetails] create_filter_group_details Details of the new filter group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_retry_token A token that uniquely identifies a request so it can be retried in case of a timeout or
    #   server error without risk of executing that same action again. Retry tokens expire after 24
    #   hours, but can be invalidated before then due to conflicting operations. For example, if a resource
    #   has been deleted and purged from the system, then a retry of the original creation request
    #   might be rejected.
    #
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @option opts [String] :if_match The locking version, used for optimistic concurrency control.
    # @return [Response] A Response object with data of type {OCI::AnnouncementsService::Models::FilterGroup FilterGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/create_filter_group.rb.html) to see an example of how to use create_filter_group API.
    def create_filter_group(announcement_subscription_id, create_filter_group_details, opts = {})
      logger.debug 'Calling operation AnnouncementSubscriptionClient#create_filter_group.' if logger

      raise "Missing the required parameter 'announcement_subscription_id' when calling create_filter_group." if announcement_subscription_id.nil?
      raise "Missing the required parameter 'create_filter_group_details' when calling create_filter_group." if create_filter_group_details.nil?
      raise "Parameter value for 'announcement_subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(announcement_subscription_id)

      path = '/announcementSubscriptions/{announcementSubscriptionId}/filterGroups'.sub('{announcementSubscriptionId}', announcement_subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-retry-token'] = opts[:opc_retry_token] if opts[:opc_retry_token]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf
      header_params[:'opc-retry-token'] ||= OCI::Retry.generate_opc_retry_token

      post_body = @api_client.object_to_http_body(create_filter_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementSubscriptionClient#create_filter_group') do
        @api_client.call_api(
          :POST,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AnnouncementsService::Models::FilterGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes the specified announcement subscription.
    #
    # This call is subject to an Announcements limit that applies to the total number of requests across all read or write operations. Announcements might throttle this call to reject an otherwise valid request when the total rate of operations exceeds 20 requests per second for a given user. The service might also throttle this call to reject an otherwise valid request when the total rate of operations exceeds 100 requests per second for a given tenancy.
    #
    # @param [String] announcement_subscription_id The OCID of the announcement subscription.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The locking version, used for optimistic concurrency control.
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/delete_announcement_subscription.rb.html) to see an example of how to use delete_announcement_subscription API.
    def delete_announcement_subscription(announcement_subscription_id, opts = {})
      logger.debug 'Calling operation AnnouncementSubscriptionClient#delete_announcement_subscription.' if logger

      raise "Missing the required parameter 'announcement_subscription_id' when calling delete_announcement_subscription." if announcement_subscription_id.nil?
      raise "Parameter value for 'announcement_subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(announcement_subscription_id)

      path = '/announcementSubscriptions/{announcementSubscriptionId}'.sub('{announcementSubscriptionId}', announcement_subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementSubscriptionClient#delete_announcement_subscription') do
        @api_client.call_api(
          :DELETE,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Deletes a filter group in the specified announcement subscription.
    #
    # This call is subject to an Announcements limit that applies to the total number of requests across all read or write operations. Announcements might throttle this call to reject an otherwise valid request when the total rate of operations exceeds 20 requests per second for a given user. The service might also throttle this call to reject an otherwise valid request when the total rate of operations exceeds 100 requests per second for a given tenancy.
    #
    # @param [String] announcement_subscription_id The OCID of the announcement subscription.
    # @param [String] filter_group_name The name of the filter group.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @option opts [String] :if_match The locking version, used for optimistic concurrency control.
    # @return [Response] A Response object with data of type nil
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/delete_filter_group.rb.html) to see an example of how to use delete_filter_group API.
    def delete_filter_group(announcement_subscription_id, filter_group_name, opts = {})
      logger.debug 'Calling operation AnnouncementSubscriptionClient#delete_filter_group.' if logger

      raise "Missing the required parameter 'announcement_subscription_id' when calling delete_filter_group." if announcement_subscription_id.nil?
      raise "Missing the required parameter 'filter_group_name' when calling delete_filter_group." if filter_group_name.nil?
      raise "Parameter value for 'announcement_subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(announcement_subscription_id)
      raise "Parameter value for 'filter_group_name' must not be blank" if OCI::Internal::Util.blank_string?(filter_group_name)

      path = '/announcementSubscriptions/{announcementSubscriptionId}/filterGroups/{filterGroupName}'.sub('{announcementSubscriptionId}', announcement_subscription_id.to_s).sub('{filterGroupName}', filter_group_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementSubscriptionClient#delete_filter_group') do
        @api_client.call_api(
          :DELETE,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets the specified announcement subscription.
    #
    # This call is subject to an Announcements limit that applies to the total number of requests across all read or write operations. Announcements might throttle this call to reject an otherwise valid request when the total rate of operations exceeds 20 requests per second for a given user. The service might also throttle this call to reject an otherwise valid request when the total rate of operations exceeds 100 requests per second for a given tenancy.
    #
    # @param [String] announcement_subscription_id The OCID of the announcement subscription.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type {OCI::AnnouncementsService::Models::AnnouncementSubscription AnnouncementSubscription}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/get_announcement_subscription.rb.html) to see an example of how to use get_announcement_subscription API.
    def get_announcement_subscription(announcement_subscription_id, opts = {})
      logger.debug 'Calling operation AnnouncementSubscriptionClient#get_announcement_subscription.' if logger

      raise "Missing the required parameter 'announcement_subscription_id' when calling get_announcement_subscription." if announcement_subscription_id.nil?
      raise "Parameter value for 'announcement_subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(announcement_subscription_id)

      path = '/announcementSubscriptions/{announcementSubscriptionId}'.sub('{announcementSubscriptionId}', announcement_subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementSubscriptionClient#get_announcement_subscription') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AnnouncementsService::Models::AnnouncementSubscription'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Gets a list of all announcement subscriptions in the specified compartment.
    #
    # This call is subject to an Announcements limit that applies to the total number of requests across all read or write operations. Announcements might throttle this call to reject an otherwise valid request when the total rate of operations exceeds 20 requests per second for a given user. The service might also throttle this call to reject an otherwise valid request when the total rate of operations exceeds 100 requests per second for a given tenancy.
    #
    # @param [String] compartment_id The OCID of the compartment.
    #
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :lifecycle_state A filter to return only announcement subscriptions that match the given lifecycle state.
    # @option opts [String] :display_name A filter to return only resources that match the entire display name given.
    # @option opts [String] :id The OCID of the announcement subscription.
    # @option opts [Integer] :limit The maximum number of items to return in a paginated \"List\" call.
    # @option opts [String] :page The value of the `opc-next-page` response header from the previous \"List\" call.
    # @option opts [String] :sort_order The sort order to use, whether ascending ('ASC') or descending ('DESC').
    # @option opts [String] :sort_by The criteria to sort by. You can specify only one sort order. The default sort order for the creation date of resources is descending. The default sort order for display names is ascending.
    #    (default to timeCreated)
    #   Allowed values are: timeCreated, displayName
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type {OCI::AnnouncementsService::Models::AnnouncementSubscriptionCollection AnnouncementSubscriptionCollection}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/list_announcement_subscriptions.rb.html) to see an example of how to use list_announcement_subscriptions API.
    def list_announcement_subscriptions(compartment_id, opts = {})
      logger.debug 'Calling operation AnnouncementSubscriptionClient#list_announcement_subscriptions.' if logger

      raise "Missing the required parameter 'compartment_id' when calling list_announcement_subscriptions." if compartment_id.nil?

      if opts[:lifecycle_state] && !OCI::AnnouncementsService::Models::AnnouncementSubscription::LIFECYCLE_STATE_ENUM.include?(opts[:lifecycle_state])
        raise 'Invalid value for "lifecycle_state", must be one of the values in OCI::AnnouncementsService::Models::AnnouncementSubscription::LIFECYCLE_STATE_ENUM.'
      end

      if opts[:sort_order] && !OCI::AnnouncementsService::Models::SORT_ORDER_ENUM.include?(opts[:sort_order])
        raise 'Invalid value for "sort_order", must be one of the values in OCI::AnnouncementsService::Models::SORT_ORDER_ENUM.'
      end

      if opts[:sort_by] && !%w[timeCreated displayName].include?(opts[:sort_by])
        raise 'Invalid value for "sort_by", must be one of timeCreated, displayName.'
      end

      path = '/announcementSubscriptions'
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}
      query_params[:compartmentId] = compartment_id
      query_params[:lifecycleState] = opts[:lifecycle_state] if opts[:lifecycle_state]
      query_params[:displayName] = opts[:display_name] if opts[:display_name]
      query_params[:id] = opts[:id] if opts[:id]
      query_params[:limit] = opts[:limit] if opts[:limit]
      query_params[:page] = opts[:page] if opts[:page]
      query_params[:sortOrder] = opts[:sort_order] if opts[:sort_order]
      query_params[:sortBy] = opts[:sort_by] if opts[:sort_by]

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = nil

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementSubscriptionClient#list_announcement_subscriptions') do
        @api_client.call_api(
          :GET,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AnnouncementsService::Models::AnnouncementSubscriptionCollection'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates the specified announcement subscription.
    #
    # This call is subject to an Announcements limit that applies to the total number of requests across all read or write operations. Announcements might throttle this call to reject an otherwise valid request when the total rate of operations exceeds 20 requests per second for a given user. The service might also throttle this call to reject an otherwise valid request when the total rate of operations exceeds 100 requests per second for a given tenancy.
    #
    # @param [String] announcement_subscription_id The OCID of the announcement subscription.
    # @param [OCI::AnnouncementsService::Models::UpdateAnnouncementSubscriptionDetails] update_announcement_subscription_details The subscription information to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :if_match The locking version, used for optimistic concurrency control.
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @return [Response] A Response object with data of type {OCI::AnnouncementsService::Models::AnnouncementSubscription AnnouncementSubscription}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/update_announcement_subscription.rb.html) to see an example of how to use update_announcement_subscription API.
    def update_announcement_subscription(announcement_subscription_id, update_announcement_subscription_details, opts = {})
      logger.debug 'Calling operation AnnouncementSubscriptionClient#update_announcement_subscription.' if logger

      raise "Missing the required parameter 'announcement_subscription_id' when calling update_announcement_subscription." if announcement_subscription_id.nil?
      raise "Missing the required parameter 'update_announcement_subscription_details' when calling update_announcement_subscription." if update_announcement_subscription_details.nil?
      raise "Parameter value for 'announcement_subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(announcement_subscription_id)

      path = '/announcementSubscriptions/{announcementSubscriptionId}'.sub('{announcementSubscriptionId}', announcement_subscription_id.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_announcement_subscription_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementSubscriptionClient#update_announcement_subscription') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AnnouncementsService::Models::AnnouncementSubscription'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines


    # Updates a filter group in the specified announcement subscription.
    #
    # This call is subject to an Announcements limit that applies to the total number of requests across all read or write operations. Announcements might throttle this call to reject an otherwise valid request when the total rate of operations exceeds 20 requests per second for a given user. The service might also throttle this call to reject an otherwise valid request when the total rate of operations exceeds 100 requests per second for a given tenancy.
    #
    # @param [String] announcement_subscription_id The OCID of the announcement subscription.
    # @param [String] filter_group_name The name of the filter group.
    # @param [OCI::AnnouncementsService::Models::UpdateFilterGroupDetails] update_filter_group_details The filter group information to update.
    # @param [Hash] opts the optional parameters
    # @option opts [OCI::Retry::RetryConfig] :retry_config The retry configuration to apply to this operation. If no key is provided then the service-level
    #   retry configuration defined by {#retry_config} will be used. If an explicit `nil` value is provided then the operation will not retry
    # @option opts [String] :opc_request_id The unique Oracle-assigned identifier for the request. If you need to contact Oracle about
    #   a particular request, please provide the complete request ID.
    #
    # @option opts [String] :if_match The locking version, used for optimistic concurrency control.
    # @return [Response] A Response object with data of type {OCI::AnnouncementsService::Models::FilterGroup FilterGroup}
    # @note Click [here](https://docs.cloud.oracle.com/en-us/iaas/tools/ruby-sdk-examples/latest/announcementsservice/update_filter_group.rb.html) to see an example of how to use update_filter_group API.
    def update_filter_group(announcement_subscription_id, filter_group_name, update_filter_group_details, opts = {})
      logger.debug 'Calling operation AnnouncementSubscriptionClient#update_filter_group.' if logger

      raise "Missing the required parameter 'announcement_subscription_id' when calling update_filter_group." if announcement_subscription_id.nil?
      raise "Missing the required parameter 'filter_group_name' when calling update_filter_group." if filter_group_name.nil?
      raise "Missing the required parameter 'update_filter_group_details' when calling update_filter_group." if update_filter_group_details.nil?
      raise "Parameter value for 'announcement_subscription_id' must not be blank" if OCI::Internal::Util.blank_string?(announcement_subscription_id)
      raise "Parameter value for 'filter_group_name' must not be blank" if OCI::Internal::Util.blank_string?(filter_group_name)

      path = '/announcementSubscriptions/{announcementSubscriptionId}/filterGroups/{filterGroupName}'.sub('{announcementSubscriptionId}', announcement_subscription_id.to_s).sub('{filterGroupName}', filter_group_name.to_s)
      operation_signing_strategy = :standard

      # rubocop:disable Style/NegatedIf
      # Query Params
      query_params = {}

      # Header Params
      header_params = {}
      header_params[:accept] = 'application/json'
      header_params[:'content-type'] = 'application/json'
      header_params[:'opc-request-id'] = opts[:opc_request_id] if opts[:opc_request_id]
      header_params[:'if-match'] = opts[:if_match] if opts[:if_match]
      # rubocop:enable Style/NegatedIf

      post_body = @api_client.object_to_http_body(update_filter_group_details)

      # rubocop:disable Metrics/BlockLength
      OCI::Retry.make_retrying_call(applicable_retry_config(opts), call_name: 'AnnouncementSubscriptionClient#update_filter_group') do
        @api_client.call_api(
          :PUT,
          path,
          endpoint,
          header_params: header_params,
          query_params: query_params,
          operation_signing_strategy: operation_signing_strategy,
          body: post_body,
          return_type: 'OCI::AnnouncementsService::Models::FilterGroup'
        )
      end
      # rubocop:enable Metrics/BlockLength
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Style/IfUnlessModifier, Metrics/ParameterLists
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines

    private

    def applicable_retry_config(opts = {})
      return @retry_config unless opts.key?(:retry_config)

      opts[:retry_config]
    end
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
