##############################################################################
# This is default entrypoint.
#  - Ensure user provided region is valid
#  - Ensure user provided resource_group is valid
##############################################################################

##############################################################################
# Read/validate Region
##############################################################################
data "ibm_is_region" "region" {
  name = "${var.region}"
}

##############################################################################
# Read/validate Zone
##############################################################################
data "ibm_is_zone" "zone" {
  depends_on = ["data.ibm_is_subnet.f5_subnet1"]
  name = "${data.ibm_is_subnet.f5_subnet1.zone}"
  region = "${data.ibm_is_region.region.name}"
}

##############################################################################
# Read/validate Resource Group
##############################################################################
data "ibm_resource_group" "rg" {
  depends_on = ["data.ibm_is_subnet.f5_subnet1"]
  name = "${data.ibm_is_subnet.f5_subnet1.resource_group_name}"
}
