[
  {
    "name": "${application_name}",
    "command": "${container_command}",
    "image": "${ecr_url}:latest",
    "cpuReservation": ${cpu_reservation},
    "memoryReservation": ${memory_reservation},
    "network_mode": "bridge",
    "secrets": "${secret_arn}",
    "portMappings": [
      {
        "containerPort": ${application_port},
        "hostPort": ${host_port},
        "protocol": "tcp"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${log_group}",
        "awslogs-region": "${aws_region}",
        "awslogs-stream-prefix": "${application_name}"
      }
    },
    "healthCheck": {
      "interval": ${interval},
      "timeout": ${timeout},
      "retries": ${retries},
      "startPeriod": ${startPeriod}
    }
  }
]