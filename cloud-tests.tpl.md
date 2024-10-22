# Pull cloud client

```ucm
cloud/main> pull.without-history @unison/cloud/${CLOUD_CLIENT_VERSION}
```

# Run non-IO tests

```ucm
cloud/main> test
```

# Run local IO tests

```ucm
cloud/main> io.test tests.cloud.runAllLocally
```

# Run remote IO tests

```ucm
cloud/main> io.test tests.cloud.runAll
```
