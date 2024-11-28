# KeyCloak 検証

## 証明書や秘密鍵の作成

```bash
$ cd ./certs
$ openssl genrsa -out privkey.pem 2048
$ openssl req -new -key privkey.pem -out keycloak.csr -config san.cnf
$ openssl x509 -req -in keycloak.csr -signkey privkey.pem -out fullchain.pem -days 365 -extensions req_ext -extfile san.cnf
```

san.cnf は事前に作成しておく. 以下の設定が必須.

```
[ alt_names ]
DNS.1 = master.keycloak.local
DNS.2 = first.keycloak.local
DNS.3 = second.keycloak.local
```

## hosts の設定

Cookie が競合しないように FQDN を設定しておく.

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
| OIDC Provider 1 | [http://first.keycloak.local:8443](http://first.keycloak.local:8443)   | admin | password |
| OIDC Provider 1 | [http://second.keycloak.local:8443](http://keyclosecond.ak.local:8443) | admin | password |
