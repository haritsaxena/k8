clear
sudo microk8s kubectl get all #--all-namespaces

sudo microk8s kubectl apply -f kuard-pod.yml

sudo microk8s kubectl get pods

sudo microk8s kubectl get pod kuard -o yaml > kuard-temp.yaml
sudo microk8s kubectl port-forward kuard 8080:8080

sudo microk8s kubectl proxy
http://127.0.0.1:8001/api/v1/namespaces/default/pods

sudo microk8s kubectl delete pod kuard
sudo microk8s kubectl apply -f kuard-pod-health.yaml

sudo microk8s kubectl get events
sudo microk8s kubectl apply -f kuard-pod-reslim.yaml
