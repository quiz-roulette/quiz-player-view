# Simple Quiz Application in Vue
This is an simple OnePage Application Written in Vue2. You can integrate it anywhere in your vueJS application. It has a simple time with loading animations. Since it is open source feel free to contribute to this simple quiz Application.

[![Deploy to DO](https://mp-assets1.sfo2.digitaloceanspaces.com/deploy-to-do/do-btn-blue.svg)](https://cloud.digitalocean.com/apps/new?repo=https://github.com/arpan45/simple-quiz-vue/tree/main)

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).


### Deploy to Docker / K8

To build Docker:

```
docker build -t quizroulette/quiz-player-view:v1.0.0 .
```

To Deploy to Docker hub:

```
docker push quizroulette/quiz-player-view:v1.0.0
```


To Setup K8:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: quiz-roulette-quiz-player-view-app-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      io.kompose.service: quiz-roulette-quiz-player-view-app
  strategy: {}
  template:
    metadata:
      labels:
        io.kompose.service: quiz-roulette-quiz-player-view-app
    spec:
      containers:
        - image: quizroulette/quiz-player-view:v1.0.0
          name: quiz-player-view
          ports:
            - containerPort: 8080
          resources: {}
          env:
            - name: VUE_APP_QUESTION_BANK_API
              value: "http://localhost:9999"
      restartPolicy: Always
status: {}
```

To Setup Load Balancer:
```
kubectl expose deployment quiz-roulette-quiz-player-view-app-deployment --type=LoadBalancer --name=quiz-roulette-quiz-player-view-app-service
```

### Deploying to GCP

#### Step 1: Build the image
```
gcloud builds submit --tag gcr.io/endless-comfort-334004/quiz-vue-app

eval $(minikube docker-env)
docker build -t gcr.io/endless-comfort-334004/quiz-vue-app .
```

#### Step 2: Use Cloud Run
```
gcloud run deploy quiz-vue-app --image gcr.io/endless-comfort-334004/quiz-vue-app --platform managed --region asia-southeast1
```

For No traffic:
```
gcloud run deploy quiz-vue-app --image gcr.io/endless-comfort-334004/quiz-vue-app --platform managed --region asia-southeast1 
--no-traffic --tag green
```