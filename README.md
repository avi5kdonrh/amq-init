# amq-init for mysql database

- Put the mysql connector jar in the lib directory
- Edit the config/post-config.sh and specify the url,username, and password

Then, execute these commands:

- export IMG_NAME="amq-broker-init"
- export PROJECT=amq79

- oc create secret docker-registry registry-redhat-io \
  --docker-server=registry.redhat.io \
  --docker-username=xxxxx \
  --docker-password=xxx \
  --docker-email=xxxx
  
-  oc new-build --binary --name=$IMG_NAME -l app=$IMG_NAME
-  oc patch bc/$IMG_NAME -p '{"spec":{"strategy":{"dockerStrategy":{"dockerfilePath":"Dockerfile"}}}}'
-  oc set build-secret --pull bc/$IMG_NAME registry-redhat-io
-  oc start-build $IMG_NAME --from-dir=. --follow

- If the build finishes successfully, you'll see the "Push successful" message 

- Now specify the `image-registry.openshift-image-registry.svc:5000/amq79/amq-broker-init` as the init-container image in the activemqartemis cr

