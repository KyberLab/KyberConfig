#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#



# (Required) Build type
IMAGE_BUILD_TYPE			:= Custom

# (Required) Fetch options
IMAGE_FETCH_METHOD			:= git
IMAGE_FETCH_OPTS			:= --recursive
IMAGE_FETCH_URL				:= https://github.com/rcore-os/tg-rcore-tutorial.git
IMAGE_FETCH_REF				:= test

# (Optional) Patch options
IMAGE_PATCH_METHOD			:= skip
IMAGE_PATCH_OPTS			:= 

# (Required) Config options
IMAGE_CONFIG_METHOD			:= skip
IMAGE_CONFIG_OPTS			:= 

# (Optional) Build options
IMAGE_BUILD_METHOD			:= custom
IMAGE_BUILD_OPTS			:= 

# (Optional) Install options
IMAGE_INSTALL_METHOD		:= skip
IMAGE_INSTALL_OPTS			:= 
IMAGE_INSTALL_LIST			:= 

# (Optional) Package options
IMAGE_PACKAGE_METHOD		:= skip
IMAGE_PACKAGE_OPTS			:= 
IMAGE_PACKAGE_LIST			:= 

# (Optional) Clean options
IMAGE_CLEAN_METHOD			:= custom
IMAGE_CLEAN_OPTS			:= 

# (Optional) Distclean options
IMAGE_DISTCLEAN_METHOD		:= custom
IMAGE_DISTCLEAN_OPTS		:= 

# (Optional) Remove options
IMAGE_REMOVE_METHOD			:= git
IMAGE_REMOVE_OPTS			:= 

# (Optional) Info options
IMAGE_INFO_METHOD			:= dump
IMAGE_INFO_OPTS				:= 

# (Optional) Status options
IMAGE_STATUS_METHOD			:= dump
IMAGE_STATUS_OPTS			:= 

# (Optional) Action options
IMAGE_ACTION_METHOD			:= custom
IMAGE_ACTION_OPTS			:= 

# (Optional) Summary options
IMAGE_SUMMARY_METHOD		:= dump
IMAGE_SUMMARY_OPTS			:= 

###############################################################################
# Image Build Variables (Optional)

IMAGE_RCORE_CHAPTER			?= ch3
IMAGE_RCORE_MODE			?= default

IMAGE_EXPORT_ENV			+= RISCARCH=riscv64gc-unknown-none-elf
IMAGE_EXPORT_ENV			+= BOOT_LOADER=rustsbi

###############################################################################
# Extra step

# image_custom_fetch
# $(1) fetch options
# $(2) config path
# $(3) build path
# $(4) install path
# $(5) fetch url
# $(6) fetch ref
define image_custom_fetch
	$(Q)$(call xprint_title,	"Image $(IMAGE_BUILD_GOAL) Fetch",$(BG_YELLOW))
	$(Q)$(call xprint_value,	"Fetch Options",	$(1),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Config Path",		$(2),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Build Path",		$(3),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Install Path",		$(4),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Fetch URL",		$(5),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Fetch REF",		$(6),$(BG_PURPLE))
	$(Q)$(call xprint_line,$(BG_YELLOW))
	$(Q)mkdir -pv $(3)
	$(Q)if [ ! -d "$(3)/.git" ]; then \
		git clone $(1) $(5) $(3); \
	fi
	$(Q)cd $(3) && git fetch --all && git checkout $(6)
	$(Q)cd $(3) && bash scripts/extract_submodules.sh
endef


# image_custom_patch
# $(1) patch options
# $(2) config path
# $(3) build path
# $(4) install path
define image_custom_patch
	$(Q)$(call xprint_title,	"Image $(IMAGE_BUILD_GOAL) Patch",$(BG_YELLOW))
	$(Q)$(call xprint_value,	"Patch Options",	$(1),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Config Path",		$(2),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Build Path",		$(3),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Install Path",		$(4),$(BG_PURPLE))
	$(Q)$(call xprint_line,$(BG_YELLOW))
endef


# image_custom_config
# $(1) config options
# $(2) config path
# $(3) build path
# $(4) install path
define image_custom_config
	$(Q)$(call xprint_title,	"Image $(IMAGE_BUILD_GOAL) Config",$(BG_YELLOW))
	$(Q)$(call xprint_value,	"Config Options",	$(1),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Config Path",		$(2),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Build Path",		$(3),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Install Path",		$(4),$(BG_PURPLE))
	$(Q)$(call xprint_line,$(BG_YELLOW))
endef


# image_custom_build
# $(1) build options
# $(2) config path
# $(3) build path
# $(4) install path
define image_custom_build
	$(Q)$(call xprint_title,	"Image $(IMAGE_BUILD_GOAL) Build",$(BG_YELLOW))
	$(Q)$(call xprint_value,	"Build Options",	$(1),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Config Path",		$(2),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Build Path",		$(3),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Install Path",		$(4),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Chapter",		$(IMAGE_RCORE_CHAPTER),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Mode",			$(IMAGE_RCORE_MODE),$(BG_PURPLE))
	$(Q)$(call xprint_line,$(BG_YELLOW))
	$(Q)cd $(3)/tg-rcore-tutorial-$(IMAGE_RCORE_CHAPTER) && \
		$(IMAGE_EXPORT_ENV) cargo build $(1)
endef


# image_custom_install
# $(1) install options
# $(2) config path
# $(3) build path
# $(4) install path
# $(5) install list
define image_custom_install
	$(Q)$(call xprint_title,	"Image $(IMAGE_BUILD_GOAL) Install",$(BG_YELLOW))
	$(Q)$(call xprint_value,	"Install Options",	$(1),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Config Path",		$(2),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Build Path",		$(3),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Install Path",		$(4),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Install List",		$(5),$(BG_PURPLE))
	$(Q)$(call xprint_line,$(BG_YELLOW))
endef


# image_custom_package
# $(1) package options
# $(2) config path
# $(3) build path
# $(4) install path
# $(5) package list
define image_custom_package
	$(Q)$(call xprint_title,	"Image $(IMAGE_BUILD_GOAL) Package",$(BG_YELLOW))
	$(Q)$(call xprint_value,	"Package Options",	$(1),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Config Path",		$(2),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Build Path",		$(3),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Install Path",		$(4),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Package List",		$(5),$(BG_PURPLE))
	$(Q)$(call xprint_line,$(BG_YELLOW))
endef


# image_custom_clean
# $(1) clean options
# $(2) config path
# $(3) build path
# $(4) install path
define image_custom_clean
	$(Q)$(call xprint_title,	"Image $(IMAGE_BUILD_GOAL) Clean",$(BG_YELLOW))
	$(Q)$(call xprint_value,	"Clean Options",	$(1),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Config Path",		$(2),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Build Path",		$(3),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Install Path",		$(4),$(BG_PURPLE))
	$(Q)$(call xprint_line,$(BG_YELLOW))
	$(Q)cd $(3)/tg-rcore-tutorial-$(IMAGE_RCORE_CHAPTER) && \
		$(IMAGE_EXPORT_ENV) cargo clean $(1)
endef


# image_custom_distclean
# $(1) distclean options
# $(2) config path
# $(3) build path
# $(4) install path
define image_custom_distclean
	$(Q)$(call xprint_title,	"Image $(IMAGE_BUILD_GOAL) Distclean",$(BG_YELLOW))
	$(Q)$(call xprint_value,	"Distclean Options",$(1),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Config Path",		$(2),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Build Path",		$(3),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Install Path",		$(4),$(BG_PURPLE))
	$(Q)$(call xprint_line,$(BG_YELLOW))
	$(Q)cd $(3)/tg-rcore-tutorial-$(IMAGE_RCORE_CHAPTER) && \
		$(IMAGE_EXPORT_ENV) cargo clean && \
		rm -rf target
endef


# image_custom_action
# $(1) action options
# $(2) config path
# $(3) build path
# $(4) install path
define image_custom_action
	$(Q)$(call xprint_title,	"Image $(IMAGE_BUILD_GOAL) Action",$(BG_YELLOW))
	$(Q)$(call xprint_value,	"Action Options",	$(1),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Config Path",		$(2),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Build Path",		$(3),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Install Path",		$(4),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Chapter",		$(IMAGE_RCORE_CHAPTER),$(BG_PURPLE))
	$(Q)$(call xprint_value,	"Mode",			$(IMAGE_RCORE_MODE),$(BG_PURPLE))
	$(Q)$(call xprint_line,$(BG_YELLOW))
	$(Q)cd $(3)/tg-rcore-tutorial-$(IMAGE_RCORE_CHAPTER) && \
		$(IMAGE_EXPORT_ENV) cargo run $(1)
endef
