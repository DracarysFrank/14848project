- Deploy microservices
1. In k8s folder, run "kubectl apply -f . "
2. get the pod name of hadoop deployment, use "kubectl get pods"
3. enter shell of the hadoop pod, use "kubectl exec -it --namespace=default sa-hadoop-base-xxxxxxxxx-xxxxx -- bin/sh"
4. in the shell of the hadoop pod, run "./run.sh" and then exit the hadoop pod
5. install helm if it is not installed by:
   
   curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
   
   chmod 700 get_helm.sh
   
   ./get_helm.sh
    
6. inside k8s folder, run "helm install spark ./spark" to deploy spark microservice
7. get the pod name of terminal deployment, use "kubectl get pods"
8. enter shell of the terminal pod, use "kubectl exec -it --namespace=default sa-terminal-app-xxxxxxxxx-xxxxx -- /bin/bash"
9. User can run terminal app from here by "python3 main.py"
NOTE: one static IP address is used for all microservices, in my cluster the static IP address is 35.227.16.143.
   For testing and grading, please change the LoadBalancer IP in each service.yaml file
   In the terminal app, the static IP is hardcoded, which should also be replaced with testing service IP address to access 
   the microservices.
   Different microservices run on different ports: 
   Jupyter-8888; Hadoop-9870; Spark-8081; sonarqube and sonar-scanner - 9000
   
10. To use the sonar-scanner cli, one need to get into the pod of sonarqube by 
    "kubectl exec -it --namespace=default sa-sonar-xxxxxxxxx-xxxxx -- /bin/bash" and then run "sonar-scanner" 
    (with -D options if wanted) to start the sonar-scanner.