eval $(minikube docker-env)
docker build --tag quiz-roulette/quiz-vue-js ./
#kubectl create -f ./k8/pod.yaml
kubectl create -f ./k8/deployment.yaml
kubectl create -f ./k8/service.yaml
kubectl expose quiz-vue-app --type="NodePort" --port 8080