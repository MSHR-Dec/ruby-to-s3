docker_compose('compose.yaml')

docker_build(
    'ruby-to-s3:latest',
    context='.',
    dockerfile='Dockerfile'
)

k8s_yaml('./k8s/configmap.yaml')
k8s_yaml('./k8s/direct.yaml')
k8s_yaml('./k8s/sidecar.yaml')
