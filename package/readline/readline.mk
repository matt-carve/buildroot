################################################################################
#
# readline
#
################################################################################

READLINE_VERSION = 7.0
READLINE_SITE = $(BR2_GNU_MIRROR)/readline
READLINE_INSTALL_STAGING = YES
READLINE_DEPENDENCIES = ncurses
READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
	bash_cv_wcwidth_broken=no
READLINE_LICENSE = GPLv3+
READLINE_LICENSE_FILES = COPYING

define READLINE_PURGE_EXAMPLES
	rm -rf $(TARGET_DIR)/usr/share/readline
endef

define INSTALL_PKG_CONFIG
	$(INSTALL) -m 0644 -D $(@D)/readline.pc $(STAGING_DIR)/usr/lib/pkgconfig/readline.pc
endef

READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_PURGE_EXAMPLES
READLINE_POST_INSTALL_TARGET_HOOKS += INSTALL_PKG_CONFIG

$(eval $(autotools-package))
