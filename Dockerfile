FROM debian:buster-20210927-slim AS base
MAINTAINER Sean Morris <sean@seanmorr.is>

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends curl gnupg lsb-release software-properties-common; \
	curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - ; \
	apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"; \
	apt-get update; \
	apt-get install terraform; \
	apt autoremove; \
	apt clean all;

ENTRYPOINT ["terraform"]
