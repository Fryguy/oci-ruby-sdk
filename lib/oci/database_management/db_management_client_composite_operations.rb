# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This class provides a wrapper around {OCI::DatabaseManagement::DbManagementClient} and offers convenience methods
  # for operations that would otherwise need to be chained together. For example, instead of performing an action
  # on a resource (e.g. launching an instance, creating a load balancer) and then using a waiter to wait for the resource
  # to enter a given state, you can call a single method in this class to accomplish the same functionality
  class DatabaseManagement::DbManagementClientCompositeOperations
    # The {OCI::DatabaseManagement::DbManagementClient} used to communicate with the service_client
    #
    # @return [OCI::DatabaseManagement::DbManagementClient]
    attr_reader :service_client

    # Initializes a new DbManagementClientCompositeOperations
    #
    # @param [OCI::DatabaseManagement::DbManagementClient] service_client The client used to communicate with the service.
    #   Defaults to a new service client created via {OCI::DatabaseManagement::DbManagementClient#initialize} with no arguments
    def initialize(service_client = OCI::DatabaseManagement::DbManagementClient.new)
      @service_client = service_client
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/ParameterLists, Metrics/PerceivedComplexity
    # rubocop:disable Layout/EmptyLines


    # Calls {OCI::DatabaseManagement::DbManagementClient#create_job} and then waits for the {OCI::DatabaseManagement::Models::Job} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::DatabaseManagement::Models::CreateJobDetails] create_job_details The details required to create a job.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DatabaseManagement::Models::Job#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DatabaseManagement::DbManagementClient#create_job}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DatabaseManagement::Models::Job}
    def create_job_and_wait_for_state(create_job_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_job(create_job_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_job(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DatabaseManagement::DbManagementClient#create_managed_database_group} and then waits for the {OCI::DatabaseManagement::Models::ManagedDatabaseGroup} acted upon
    # to enter the given state(s).
    #
    # @param [OCI::DatabaseManagement::Models::CreateManagedDatabaseGroupDetails] create_managed_database_group_details The details required to create a Managed Database Group.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DatabaseManagement::Models::ManagedDatabaseGroup#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DatabaseManagement::DbManagementClient#create_managed_database_group}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DatabaseManagement::Models::ManagedDatabaseGroup}
    def create_managed_database_group_and_wait_for_state(create_managed_database_group_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.create_managed_database_group(create_managed_database_group_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_managed_database_group(wait_for_resource_id).wait_until(
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


    # Calls {OCI::DatabaseManagement::DbManagementClient#delete_job} and then waits for the {OCI::DatabaseManagement::Models::Job} acted upon
    # to enter the given state(s).
    #
    # @param [String] job_id The identifier of the job.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DatabaseManagement::Models::Job#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DatabaseManagement::DbManagementClient#delete_job}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_job_and_wait_for_state(job_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_job(job_id)
      operation_result = @service_client.delete_job(job_id, base_operation_opts)

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


    # Calls {OCI::DatabaseManagement::DbManagementClient#delete_managed_database_group} and then waits for the {OCI::DatabaseManagement::Models::ManagedDatabaseGroup} acted upon
    # to enter the given state(s).
    #
    # @param [String] managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DatabaseManagement::Models::ManagedDatabaseGroup#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DatabaseManagement::DbManagementClient#delete_managed_database_group}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type nil
    def delete_managed_database_group_and_wait_for_state(managed_database_group_id, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      initial_get_result = @service_client.get_managed_database_group(managed_database_group_id)
      operation_result = @service_client.delete_managed_database_group(managed_database_group_id, base_operation_opts)

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


    # Calls {OCI::DatabaseManagement::DbManagementClient#update_managed_database_group} and then waits for the {OCI::DatabaseManagement::Models::ManagedDatabaseGroup} acted upon
    # to enter the given state(s).
    #
    # @param [String] managed_database_group_id The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Managed Database Group.
    # @param [OCI::DatabaseManagement::Models::UpdateManagedDatabaseGroupDetails] update_managed_database_group_details The details required to update a Managed Database Group.
    # @param [Array<String>] wait_for_states An array of states to wait on. These should be valid values for {OCI::DatabaseManagement::Models::ManagedDatabaseGroup#lifecycle_state}
    # @param [Hash] base_operation_opts Any optional arguments accepted by {OCI::DatabaseManagement::DbManagementClient#update_managed_database_group}
    # @param [Hash] waiter_opts Optional arguments for the waiter. Keys should be symbols, and the following keys are supported:
    #   * max_interval_seconds: The maximum interval between queries, in seconds.
    #   * max_wait_seconds The maximum time to wait, in seconds
    #
    # @return [OCI::Response] A {OCI::Response} object with data of type {OCI::DatabaseManagement::Models::ManagedDatabaseGroup}
    def update_managed_database_group_and_wait_for_state(managed_database_group_id, update_managed_database_group_details, wait_for_states = [], base_operation_opts = {}, waiter_opts = {})
      operation_result = @service_client.update_managed_database_group(managed_database_group_id, update_managed_database_group_details, base_operation_opts)

      return operation_result if wait_for_states.empty?

      lowered_wait_for_states = wait_for_states.map(&:downcase)
      wait_for_resource_id = operation_result.data.id

      begin
        waiter_result = @service_client.get_managed_database_group(wait_for_resource_id).wait_until(
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
