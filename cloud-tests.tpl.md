# Prep codebase

If there is an existing `cloud` project, we want to delete it to prevent collisions. If there isn't one this command would fail, so we use `ucm:error`. But we have to add in a dummy failure to satisfy `ucm:error` in the case that the project _does_ exist and thus the `delete.project` is successful.

```ucm:error
scratch/main> delete.project cloud
scratch/main> forceBlockToFail
```

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
