{
    "client_addr": "0.0.0.0",
    "bind_addr": "{{ ansible_enp0s8.ipv4.address }}",
    "bootstrap_expect": 3,
    "server": true,
    "datacenter": "hashilab",
    "data_dir": "/var/consul",
    "encrypt": "sg1BW+crodPG9OiOB4zwbg==",
    "dns_config": {
        "allow_stale": true,
        "max_stale": "15s"
    },
    "retry_join": [
      "192.168.56.40",
      "192.168.56.42",
      "192.168.56.44"
    ],
    "retry_interval": "10s",
    "retry_max": 100,
    "skip_leave_on_interrupt": true,
    "leave_on_terminate": true,
    "ports": {
        "dns": 53
    },
    "recursors": ["192.168.100.1"],
    "rejoin_after_leave": true,
    "ui": true
}
