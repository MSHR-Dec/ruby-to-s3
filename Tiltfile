docker_compose('compose.yaml')

docker_build(
    'ruby-to-s3:latest',
    context='.',
    dockerfile='Dockerfile'
)

k8s_yaml('./k8s/direct.yaml')
k8s_yaml('./k8s/native-sidecar.yaml')
k8s_yaml('./k8s/no-sidecar.yaml')
k8s_yaml('./k8s/completed.yaml')
k8s_yaml('./k8s/completed2.yaml')
k8s_yaml('./k8s/completed-bector.yaml')
k8s_yaml('./k8s/completed-waiting-vector.yaml')
k8s_yaml('./k8s/executing.yaml')
k8s_yaml('./k8s/executing-waiting-vector.yaml')
# k8s_yaml('./k8s/example.yaml')
