## common_schema [![Build Status](https://travis-ci.org/Oefenweb/ansible-common-schema.svg?branch=master)](https://travis-ci.org/Oefenweb/ansible-common-schema)

Set up [common_schema](https://code.google.com/p/common-schema/) (DBA's framework for MySQL).

#### Requirements

* `mysql-server` (5.1, 5.5, 5.6, Percona Server or MariaDB)

#### Variables

* `common_schema_version` [default: `2.2`]: Version to install

## Dependencies

None

#### Example

```yaml
---
- hosts: all
  roles:
  - common-schema
```

#### License

MIT

#### Author Information

Mischa ter Smitten

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Oefenweb/ansible-common-schema/issues)!
