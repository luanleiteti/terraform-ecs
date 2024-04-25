version: 0.0
Resources:
  - TargetService:
      Type: AWS::ECS::Service
      Properties:
        TaskDefinition: "${TaskDefinition_arn}"
        LoadBalancerInfo:
          ContainerName: "${application_name}"
          ContainerPort: ${application_port}