FROM quay.io/keycloak/keycloak:26.0.5

ENV KC_DB=postgres
ENV KC_FEATURES=organization
WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]