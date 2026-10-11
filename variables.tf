variable "spanner_databases" {
  description = <<EOT
Map of spanner_databases, attributes below
Required:
    - instance
    - name
Optional:
    - database_dialect
    - ddl
    - default_time_zone
    - deletion_policy
    - deletion_protection
    - enable_drop_protection
    - project
    - version_retention_period
    - encryption_config (block):
        - kms_key_name (optional)
        - kms_key_names (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    instance                 = string
    name                     = string
    database_dialect         = optional(string)
    ddl                      = optional(list(string))
    default_time_zone        = optional(string)
    deletion_policy          = optional(string)
    deletion_protection      = optional(bool)
    enable_drop_protection   = optional(bool)
    project                  = optional(string)
    version_retention_period = optional(string)
    encryption_config = optional(object({
      kms_key_name  = optional(string)
      kms_key_names = optional(list(string))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

