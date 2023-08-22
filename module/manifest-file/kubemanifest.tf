resource "kubectl_manifest" "github-runner" {
  yaml_body = <<YAML
apiVersion: actions.summerwind.dev/v1alpha1
kind: RunnerDeployment
metadata:
  name: k8s-action-runner
  namespace: actions-runner-system
spec:
 template:
   spec:
     repository: REPO_NAME_TO_REPLACE       
YAML
}

resource "kubectl_manifest" "github-runner-autoscaler" {
  depends_on = [
    kubectl_manifest.github-runner
  ]
  yaml_body = <<YAML
apiVersion: actions.summerwind.dev/v1alpha1
kind: HorizontalRunnerAutoscaler
metadata:
 name: k8s-action-runner-autoscaler
 namespace: actions-runner-system
spec:
 scaleDownDelaySecondsAfterScaleOut: 60
 scaleTargetRef:
   kind: RunnerDeployment
   name: k8s-action-runner
 minReplicas: 1
 maxReplicas: 10
 metrics:
   - type: PercentageRunnersBusy
     scaleUpThreshold: "0.75"
     scaleDownThreshold: "0.30"
     scaleUpStepFactor: "1"
     scaleDownStepFactor: "1"

YAML
}
