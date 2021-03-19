apiVersion: apps/v1
kind: Deployment
metadata:
  name: nodejs-app
  labels:
    app: nodejs-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nodejs-app
  template:
    metadata:
      labels:
        app: nodejs-app
    spec:
      containers:
      - name: my-image
        image: gcr.io/euphoric-diode-307115/my-image:COMMIT_SHA
        ports:
        - containerPort: 6060
---
kind: Service
apiVersion: v1
metadata:
  name: nodejs-app-service
spec:
  selector:
    app: nodejs-app
  ports:
  - protocol: TCP
    port: 80
    targetPort: 6060
  type: LoadBalancer
