## DELETE GLOBAL filse & Hackazone

kubectl delete -f 1_basicdeployment/global-configuration.yaml
sleep .5
kubectl delete -f 1_basicdeployment/rbac.yaml
sleep .5
kubectl delete -f 1_basicdeployment/ap-rbac.yaml
sleep .5
kubectl delete -f 1_basicdeployment/default-server-secret.yaml
sleep .5
kubectl delete -f 1_basicdeployment/nginx-config.yaml
sleep .5
kubectl delete -f 1_basicdeployment/vs-definition.yaml
sleep .5
kubectl delete -f 1_basicdeployment/vsr-definition.yaml
sleep .5
kubectl delete -f 1_basicdeployment/ts-definition.yaml
sleep .5
kubectl delete -f 1_basicdeployment/policy-definition.yaml
sleep .5
kubectl delete -f 1_basicdeployment/gc-definition.yaml
sleep .5
kubectl delete -f 1_basicdeployment/ap-logconf-definition.yaml
sleep .5
kubectl delete -f 1_basicdeployment/ap-policy-definition.yaml
sleep .5

## DELETE Ingress NGINX PLUS & Service for Ingress & dashboard for nginx

kubectl delete -f 2_nginx_ingress/
sleep .5

## DELETE arcadia & dvwa & hackazon

kubectl delete -f 3_arcadia_app/
sleep .5
kubectl delete -f 4_dvwa/
sleep .5
kubectl delete -f 5_hackazon/
sleep .5

## DELETE prometheus & grafana

kubectl delete -f 6_prometheus_grafana/
sleep .5



kubectl delete -f 1_basicdeployment/ns-and-sa.yaml
