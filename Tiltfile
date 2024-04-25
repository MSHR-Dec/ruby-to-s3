docker_compose('compose.yaml')

docker_build(
    'ruby-to-s3:latest',
    context='.',
    dockerfile='Dockerfile'
)

k8s_yaml('./k8s/direct.yaml')
k8s_yaml('./k8s/self-sidecar.yaml')
k8s_yaml('./k8s/native-sidecar.yaml')
k8s_yaml('./k8s/never-stop.yaml')
k8s_yaml('./k8s/example.yaml')
