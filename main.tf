data "oci_core_ipsec_config" "core_ipsec_config_lookup" {
  for_each = var.core_ipsec_config_lookup

  ipsec_id = each.value.ipsec_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

