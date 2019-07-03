<!-- brew install kubernetes-cli
brew cask install minikube
By default, Minikube uses a virtual machine manager. If you do not need VirtualBox, install hyperkit, which provides a minimal virtual machine manager.

brew install hyperkit
To install Helm with Homebrew, run this command in a terminal window:

brew install kubernetes-helm
To install Skaffold with Homebrew, run this command in a terminal window:

brew install skaffold


-->

### Troubleshooting
|                       |                                          |
| --------------------- | ---------------------------------------- |
| Init:Error            | An Init Container has failed to execute. |
| Init:CrashLoopBackOff | An Init Container has failed repeatedly. |


- [Debug Init Containers](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-init-containers/)
  - kubectl describe pod <pod-name>
  - kubectl logs <pod-name> -c <init-container-2>
- [Display detailed information about the Pod](https://kubernetes.io/docs/tasks/debug-application-cluster/determine-reason-pod-failure/)
  - kubectl get pod --output=yaml
```bash
kubectl get events --sort-by='{.firstTimestamp}'
kubectl get events --sort-by='{.lastTimestamp}'
```

- master and slaves
- client and server
### Master Components
- etcd cluster - a simple, distributed key value storage which is used to store the Kubernetes cluster data
- kube-apiserver
- kube-controller-manager
- cloud-controller-manager
- kube-scheduler

#### Worker Components
- kubelet
- kube-proxy
https://www.aquasec.com/wiki/display/containers/Kubernetes+Architecture+101
#### Pod
#### Service
- a service represents a logical set of pods and acts as a gateway, allowing (client) pods to send requests to the service without needing to keep track of which physical pods actually make up the service
#### Volume
- Kubernetes volume applies to a whole pod and is mounted on all containers in the pod
- data is preserved across container restarts. The volume will be removed only when the pod gets destroyed

#### Namespace
Resources inside a namespace must be unique and cannot access resources in a different namespace. Also, a namespace can be allocated a resource quota to avoid consuming more than its share of the physical cluster’s overall resources.

#### Deployment
- describes the desired state of a pod or a replica set, in a yaml file. The deployment controller then gradually updates the environment (for example, creating or deleting replicas) until the current state matches the desired state

```bash
minikube version
minikube start
kubectl version
kubectl cluster-info
kubectl get nodes
kubectl config use-context
kubectl --use-contexts= get ingress
kubectl config get-contexts
```


### Start multiple commands
```yaml
command: ["/bin/bash", "-c"]
args:
  - bash b1.sh
    bash b2.sh
```