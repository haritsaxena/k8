sudo microk8s start
#microk8s ctr images remove docker.io/library/kubia:latest

sudo microk8s kubectl apply -f deployment.yml
sudo microk8s kubectl apply -f service.yml

sudo microk8s kubectl get all #--all-namespaces

sudo microk8s kubectl delete deployment kubia-deployment
sudo microk8s kubectl delete service kubia-service

#To expose our deployment we need to create a service:
#sudo microk8s kubectl expose deployment kubia-deployment --type=NodePort --port=80 --name=kubia-service

sudo microk8s kubectl get po kubia-deployment-6885b44c5f-kk87z -o yaml

sudo microk8s kubectl get pods -o wide

# see logs from pod
sudo microk8s kubectl logs kubia-deployment-6885b44c5f-kk87z
# find issues in pod
sudo microk8s kubectl port-forward kubia-deployment-6885b44c5f-kk87z 8888:8080



sudo microk8s stop
clear
