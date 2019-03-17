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

## Usage
1. Change to ansible directory
```
cd prometheus-server-poc/ansible/
```
2. Make sure `invetory` host is set to target host machine dedicated to run prometheus server. For local testing it can be set to `127.0.0.1`
3. Run the playbook to install and configure prometheus server
```
ansible-playbook playbook.yml
``` 
for local testing where sudo may require a password
```
ansible-playbook playbook.yml --ask-become-pass
``` 
