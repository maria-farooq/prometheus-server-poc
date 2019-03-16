# prometheus-server-poc ansible
install and configure prometheus server on desired host(s)

## Project structure

```
.
├── README.md
├── ansible.cfg
├── inventory
├── playbook.yml
├── ...
├── roles/
│   ├── docker/
│   │   ├── files
│   │   ├── tasks
│   │   ├── ...
│   ├── prometheus/
│   │   ├── files
│   │   ├── tasks
│   │   ├── templates
│   │   ├── ...
│   ├── .../
```