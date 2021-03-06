# home-kubernetes


This project should help SE to set up a fully functional home env on their k8s cluster.

## Get Started!

You can use any k8s environment to play around with the following ENVIRONMENT, if you have nothing ready use DOCKER K8S or minikube.

Skip the next section if you have a running k8s, where you can play around with, but be carefully if you habe a NAMESPACE monitoring, arcadia, dvwa or hackazon. Does will be deleted at the END, if you run the cleanup.

## Change HOST name to match with what you like.

Usage: python FindAndReplace.py [Old String] [New String] ' \
    '[File Filters(default:".yaml")] [Directory To Check(./)]

Example:

```
python FindAndReplace.py example.com xyz.io
```    

Output should look like this:

```
[Old String]         : example.com
[New String]         : xyz.io
[File Filters]       : .yaml
[Directory To Check] : ./
Files found matching patterns: 30
String Found and Updating File: ./4_dvwa/ingress_dvwa.yaml
String Found and Updating File: ./4_dvwa/nap/ingress_dvwa_nap.yaml
String Found and Updating File: ./6_prometheus_grafana/prometheus.yaml
String Found and Updating File: ./6_prometheus_grafana/grafana.yaml
String Found and Updating File: ./5_hackazon/ingress_hackazon.yaml
String Found and Updating File: ./5_hackazon/nap/ingress_hackazon_nap.yaml
String Found and Updating File: ./2_nginx_ingress/db-nginx-ingress.yaml
String Found and Updating File: ./3_arcadia_app/ingress_arcadia.yaml
String Found and Updating File: ./3_arcadia_app/nap/ingress_arcadia_nap.yaml
Total Files Searched         : 30
Total Files Replaced/Updated : 9
```

### minikube

minikube is local Kubernetes, focusing on making it easy to learn and develop for Kubernetes.

All you need is Docker (or similarly compatible) container or a Virtual Machine environment, and Kubernetes is a single command away: minikube start

What you’ll need
2 CPUs or more
2GB of free memory
20GB of free disk space
Internet connection
Container or virtual machine manager, such as: Docker, Hyperkit, Hyper-V, KVM, Parallels, Podman, VirtualBox, or VMWare


### For Linux users:

Binary download
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
 sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
Debian package
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
```
RPM package
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
sudo rpm -ivh minikube-latest.x86_64.rpm
```

### for Mac users:

If the Brew Package Manager installed:
```
brew install minikube
```
If which minikube fails after installation via brew, you may have to remove the minikube cask and link the binary:

```
brew cask remove minikube
brew link minikube
```
Otherwise, download minikube directly:
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube
```

### For Windows users:

If the Chocolatey Package Manager is installed, use it to install minikube:
https://chocolatey.org/

```
choco install minikube
```
Otherwise, download and run the Windows installer

```
https://storage.googleapis.com/minikube/releases/latest/minikube-installer.exe
```


# Start with the env

I added my pvt DOMAIN (schuler.io) for myself. Feel free to change that in all the APP Deployments. If you like to keep it change you hosts file to point to your k8s node.

## Deploy the NAP DEMO

with the following shell script will you be able to deploy all Apps, with nginx ingress.(NO NAP-INGRESS RULES ADDED AT THIS STAGE)

```
./deploy-nap-demo.sh
```

List the new deployed pods:

```
kubectl get pods -owide -A
```

You should se that we newly deployed nginx KIC, ARCADIA, DVWA & Hackazon.

You will be now apple to brow your Apps in the Browser.

like dvwa.example.com:30080 or hackazon.example.com:30443

## Delete the Deployments

```
./cleanup_nap.sh
```


### Deploy the FULL Infra

You will also have the chance to deploy Prometheus & Grafana to your ENV.

If you already Deployed the NAP Demo, use the follewong command;

```
kubectl apply -f 6_prometheus_grafana/
```

This will deploy some more Pods and you will have access to Prometheus and Grafana with some pre Installed Dashboard's.

Did you not Deploy the NAP demo, lunch the Bashscript for the Full Infra;

```
./full_infra.sh
```

and to cleanup everithing after you played around, execute the CleanUP.

```
./full_cleanup.sh
```
