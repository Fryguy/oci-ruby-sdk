# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DataScience::Models
    MODEL_DEPLOYMENT_LIFECYCLE_STATE_ENUM = [
      MODEL_DEPLOYMENT_LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      MODEL_DEPLOYMENT_LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      MODEL_DEPLOYMENT_LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      MODEL_DEPLOYMENT_LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      MODEL_DEPLOYMENT_LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      MODEL_DEPLOYMENT_LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      MODEL_DEPLOYMENT_LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      MODEL_DEPLOYMENT_LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze
    ].freeze
  end
end
