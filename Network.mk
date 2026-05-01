#                                 KyberLab
# Copyright (c) 2025-2026, Kyber Development Team, all right reserved.
#




REPO_URL_IP					?= 127.0.0.1
REPO_URL_PROTO				?= https
REPO_URL_BASE				?= www.github.com
REPO_URL_PORT				?= 80
REPO_URL_GROUP				?= kyberlab


ifeq ($(REPO_URL_PROTO),ssh)

ifeq ($(REPO_URL_PORT),22)
REPO_URL_GIT_BASE			?= $(REPO_URL_PROTO)://git@$(REPO_URL_BASE)/$(REPO_URL_GROUP)
else # ($(REPO_URL_PORT),22)
REPO_URL_GIT_BASE			?= $(REPO_URL_PROTO)://git@$(REPO_URL_BASE):$(REPO_URL_PORT)/$(REPO_URL_GROUP)
endif # ($(REPO_URL_PORT),22)

else # ($(REPO_URL_PROTO),ssh)

ifeq ($(REPO_URL_PROTO),https)

ifeq ($(REPO_URL_PORT),80)
REPO_URL_GIT_BASE			?= $(REPO_URL_PROTO)://$(REPO_URL_BASE)/$(REPO_URL_GROUP)
else # ($(REPO_URL_PORT),80)
REPO_URL_GIT_BASE			?= $(REPO_URL_PROTO)://$(REPO_URL_BASE)/$(REPO_URL_PORT)/$(REPO_URL_GROUP)
endif # ($(REPO_URL_PORT),80)

else # ($(REPO_URL_PROTO),https)

$(error Unsupport REPO_URL_PROTO="$(REPO_URL_PROTO)")

endif # ($(REPO_URL_PROTO),https)

endif # ($(REPO_URL_PROTO),ssh)


BENCH_REPO_BASE				?= $(REPO_URL_BASE)/docker

BENCH_USE_DNSMAP			?= 0

