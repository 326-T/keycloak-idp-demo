# KeyCloak 検証

## 証明書の作成

```bash
$ openssl req -newkey rsa:2048 -nodes -keyout privkey.pem -x509 -days 36500 -out fullchain.pem
```

## hosts の設定

/etc/hosts

```
# Added for KeyCloak
127.0.0.1       master.keycloak.local
127.0.0.1       first.keycloak.local
127.0.0.1       second.keycloak.local
```

## KeyCloak の起動

```bash
$ docker compose up
```

| KeyCloak の用途 | URL                                                                    | admin | password |
| --------------- | ---------------------------------------------------------------------- | ----- | -------- |
| KeyCloak        | [http://master.keycloak.local:8443](http://master.keycloak.local:8443) | admin | password |
| OIDC Provider 1 | [http://first.keycloak.local:8444](http://first.keycloak.local:8444)   | admin | password |
| OIDC Provider 1 | [http://second.keycloak.local:8445](http://keyclosecond.ak.local:8445) | admin | password |
