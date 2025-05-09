# Homebrew Greptime

This tap provides Homebrew formulas for the greptime and gtctl utilities.

## Installation

```bash
brew tap greptimeteam/greptime
```

Then, you can install `greptime` or `gtctl`:

```bash
brew install greptime
brew install gtctl
```

## Upgrading

To upgrade existing installations to the latest version:

```bash
brew upgrade greptime
brew upgrade gtctl
```

## 🚀 Starting GreptimeDB

Run GreptimeDB in standalone mode with:

```bash
greptime standalone start \
  --data-home ./greptimedb_data \
  --http-addr 0.0.0.0:4000 \
  --rpc-bind-addr 0.0.0.0:4001 \
  --mysql-addr 0.0.0.0:4002 \
  --postgres-addr 0.0.0.0:4003
```

You can use the MySQL client to connect the GreptimeDB:

```sql
mysql -h 127.0.0.1 -P 4002
```

For writing data, refer to the [documentation](https://docs.greptime.com/user-guide/ingest-data/for-iot/sql/).

