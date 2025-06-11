################################################################################
#
# can-utils
#
################################################################################

CAN_UTILS_VERSION = 111f8d3acf6f6b30bf208fd9c98399c5fb9d29de
CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
CAN_UTILS_AUTORECONF = YES

$(eval $(autotools-package))
