sudo microk8s start
#microk8s ctr images remove docker.io/library/kubia:latest

#build docker image
sudo docker build . -t kubia:local
sudo docker images

#save and import
sudo docker save kubia:local > image.tar 
sudo microk8s ctr image import image.tar

# check image in microk8
sudo microk8s ctr image ls | grep kubia

sudo microk8s kubectl apply -f deployment.yml
sudo microk8s kubectl get all #--all-namespaces

sudo microk8s kubectl delete deployment kubia-deployment
sudo microk8s kubectl delete service kubia-service

#To expose our deployment we need to create a service:
sudo microk8s kubectl expose deployment kubia-deployment --type=NodePort --port=80 --name=kubia-service

sudo microk8s kubectl get pods -o wide

sudo microk8s stop
clear
