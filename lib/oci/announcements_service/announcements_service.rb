# Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module AnnouncementsService
    # Module containing models for requests made to, and responses received from,
    # OCI AnnouncementsService services
    module Models
    end
  end
end

# Require models
require 'oci/announcements_service/models/affected_resource'
require 'oci/announcements_service/models/announcement'
require 'oci/announcements_service/models/announcement_summary'
require 'oci/announcements_service/models/announcement_user_status_details'
require 'oci/announcements_service/models/announcements_collection'
require 'oci/announcements_service/models/announcements_preferences'
require 'oci/announcements_service/models/announcements_preferences_summary'
require 'oci/announcements_service/models/base_announcement'
require 'oci/announcements_service/models/base_announcements_preferences'
require 'oci/announcements_service/models/base_create_announcements_preferences_details'
require 'oci/announcements_service/models/create_announcements_preferences_details'
require 'oci/announcements_service/models/property'
require 'oci/announcements_service/models/update_announcements_preferences_details'

# Require generated clients
require 'oci/announcements_service/announcement_client'
require 'oci/announcements_service/announcements_preferences_client'

# Require service utilities
require 'oci/announcements_service/util'
