## common_schema

[![Build Status](https://travis-ci.org/Oefenweb/ansible-common-schema.svg?branch=master)](https://travis-ci.org/Oefenweb/ansible-common-schema) [![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-common--schema-blue.svg)](https://galaxy.ansible.com/list#/roles/1954)

Set up [common_schema](https://code.google.com/p/common-schema/) (DBA's framework for MySQL).

#### Requirements

* `mysql-server` (5.1, 5.5, 5.6, Percona Server or MariaDB)

#### Variables

* `common_schema_version` [default: `2.3`]: Version to install

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
