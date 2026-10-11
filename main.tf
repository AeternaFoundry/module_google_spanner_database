resource "google_spanner_database" "spanner_databases" {
  for_each = var.spanner_databases

  instance                 = each.value.instance
  name                     = each.value.name
  database_dialect         = each.value.database_dialect
  ddl                      = each.value.ddl
  default_time_zone        = each.value.default_time_zone
  deletion_policy          = each.value.deletion_policy
  deletion_protection      = each.value.deletion_protection
  enable_drop_protection   = each.value.enable_drop_protection
  project                  = each.value.project
  version_retention_period = each.value.version_retention_period

  dynamic "encryption_config" {
    for_each = each.value.encryption_config != null ? [each.value.encryption_config] : []
    content {
      kms_key_name  = encryption_config.value.kms_key_name
      kms_key_names = encryption_config.value.kms_key_names
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

