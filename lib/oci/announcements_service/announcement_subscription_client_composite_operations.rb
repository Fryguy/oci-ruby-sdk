# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::AnnouncementsService::AnnouncementSubscriptionClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class AnnouncementsService::AnnouncementSubscriptionClientCompositeOperations
    # The {OCI::AnnouncementsService::AnnouncementSubscriptionClient} used to communicate with the service_client
    #
    # @return [OCI::AnnouncementsService::AnnouncementSubscriptionClient]
    attr_reader :service_client

    # Initializes a new AnnouncementSubscriptionClientCompositeOperations
    #
    # @param [OCI::AnnouncementsService::AnnouncementSubscriptionClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::AnnouncementsService::AnnouncementSubscriptionClient#initialize} with no arguments
    def initialize(service_client = OCI::AnnouncementsService::AnnouncementSubscriptionClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::AnnouncementsService::AnnouncementSubscriptionClient#create_announcement_subscription} and then waits for the {OCI::AnnouncementsService::Models::AnnouncementSubscription} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::AnnouncementsService::Models::CreateAnnouncementSubscriptionDetails] create_announcement_subscription_details Details of the new announcement subscription.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AnnouncementsService::Models::AnnouncementSubscription#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AnnouncementsService::AnnouncementSubscriptionClient#create_announcement_subscription}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::AnnouncementsService::Models::AnnouncementSubscription}
    def create_announcement_subscription_and_wait_for_state(create_announcement_subscription_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_announcement_subscription(create_announcement_subscription_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_announcement_subscription(wait_for_resource_id).wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
        )
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::AnnouncementsService::AnnouncementSubscriptionClient#delete_announcement_subscription} and then waits for the {OCI::AnnouncementsService::Models::AnnouncementSubscription} acted upon
    # to enter the given state(s).
    #
    # @param [String] announcement_subscription_id The OCID of the announcement subscription.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AnnouncementsService::Models::AnnouncementSubscription#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AnnouncementsService::AnnouncementSubscriptionClient#delete_announcement_subscription}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_announcement_subscription_and_wait_for_state(announcement_subscription_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_announcement_subscription(announcement_subscription_id)
      operation_result = @service_client.delete_announcement_subscription(announcement_subscription_id, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)

      begin
        waiter_result = initial_get_result.wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200,
          succeed_on_not_found: true
        )
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::AnnouncementsService::AnnouncementSubscriptionClient#update_announcement_subscription} and then waits for the {OCI::AnnouncementsService::Models::AnnouncementSubscription} acted upon
    # to enter the given state(s).
    #
    # @param [String] announcement_subscription_id The OCID of the announcement subscription.
    # @param [OCI::AnnouncementsService::Models::UpdateAnnouncementSubscriptionDetails] update_announcement_subscription_details The subscription information to update.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::AnnouncementsService::Models::AnnouncementSubscription#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::AnnouncementsService::AnnouncementSubscriptionClient#update_announcement_subscription}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::AnnouncementsService::Models::AnnouncementSubscription}
    def update_announcement_subscription_and_wait_for_state(announcement_subscription_id, update_announcement_subscription_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_announcement_subscription(announcement_subscription_id, update_announcement_subscription_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_announcement_subscription(wait_for_resource_id).wait_until(
          eval_proc: ->(response) { response.data.respond_to?(:lifecycle_state) && lowered_wait_for_states.include?(response.data.lifecycle_state.downcase) },
          max_interval_seconds: waiter_opts.key?(:max_interval_seconds) ? waiter_opts[:max_interval_seconds] : 30,
          max_wait_seconds: waiter_opts.key?(:max_wait_seconds) ? waiter_opts[:max_wait_seconds] : 1200
        )
        result_to_return = waiter_result

        return result_to_return
      rescue StandardError
        raise OCI::Errors::CompositeOperationError.new(partial_results: [operation_result])
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:enable Layout/EmptyLines
  end
end
# rubocop:enable Lint/UnneededCopDisableDirective, Metrics/LineLength
