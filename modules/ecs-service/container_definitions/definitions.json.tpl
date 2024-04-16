[
  {
    "name": "${application_name}",
    "image": "${ecr_url}:latest",
    "cpuReservation": ${cpu_reservation},
    "memoryReservation": ${memory_reservation},
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
      "command": ${jsonencode(health_check_command)},
      "interval": ${health_check_interval},
      "timeout": ${health_check_timeout},
      "retries": ${health_check_retries},
      "startPeriod": ${health_check_start_period}
    }
  }
]