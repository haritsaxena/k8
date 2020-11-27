# setup component from prev
clear
sudo microk8s kubectl get all --all-namespaces

#Environment variables are one way of looking up the IP and port of a service, 
# run env command on a pod, to see all environment variables
sudo microk8s kubectl exec kubia-deployment-6885b44c5f-kk87z -- env

microk8s kubectl exec -it kubia-deployment-6885b44c5f-kk87z -- bash

# inside port
cat /etc/resolv.conf
curl http://default.svc.cluster.local

#Kubernetes supports only two types of service session affinity: None and ClientIP.
#You may be surprised it doesn’t have a cookie-based session affinity option, but you
#need to understand that Kubernetes services don’t operate at the HTTP level. Services
#deal with TCP and UDP packets and don’t care about the payload they carry. Because
#cookies are a construct of the HTTP protocol, services don’t know about them, which
#explains why session affinity cannot be based on cookies.

#Loadbalancer services operates at connection level the browser is using keep-alive connections and
#sends all its requests through a single connection. So request from loadbalancer will hit the same pod even without session affinity

# ingress don't use the service in between, directly connects to pod.
sudo microk8s kubectl apply -f ingress-service.yml

sudo microk8s enable ingress
sudo microk8s kubectl get ingress
clear

#Unlike liveness probes, if a container fails the readiness check, it won’t be killed or
#restarted. This is an important distinction between liveness and readiness probes.
#Liveness probes keep pods healthy by killing off unhealthy containers and replacing
#them with new, healthy ones, whereas readiness probes make sure that only pods that
#are ready to serve requests receive them. T


sudo microk8s kubectl proxy

sudo microk8s kubectl get events