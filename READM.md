My first project with Docker containers and Terraform IaC.

This project is a challenge to test my knowledge about DevOps Skills.

Scope:

• Code an application
• Containerize this application
• Deploy and publish this application

1) Code an application

You can choose any application, any hello world in any language will work. This application should be coded in a way that you can access through a browser (there is a bunch of examples on the web)

2)Containerize this application

Your application will run into a docker container, as a DevOps you must containerize this application: • code your docker file
• build and tag your image
• run and test the container in your local machine
• push it to a register (docker hub, AWS ECR.. doesn't matter).

3)Deploy and expose the application:

• Create an EC2 instance in POC
• install everything you need to run your docker container
• deploy your container and access your application

Have fun!!

Oh.. not so fast. We’re engineers, aren’t we? Let's automate this stuff!

Put your application code into some VCS(GitHub or GitLab, or Bitbucket as you wish)

Create a CICD Pipeline (every commit or change into the code should build a new image and deploy it in the server)

Create IaC to deploy Ec2 instance and install everything you need to run your application. All the infrastructure should be provisioned by IAC (ssh-keys, security groups, instances) MAKE SURE TO NOT EXPOSE ANY KEYS!

OBS: Use terraform to deploy instance and any tool that you want to install all needed applications into ec2 (You’ll get points if use Ansible, but it's optional).

All the processes must be automated, and no manual steps are allowed

Create a readme file in your repo with all information needed to run the project.

We’ll book a presentation in 2 weeks to get the project

The project should be done individually. The main goal here is to learn and practice an end-to-end DevOps lifecycle with a simple scenario, this task will increase your skill even at the basic level as a developer, IAC, architect and presenter

Useful links:

Install docker ubuntu:
https://www.youtube.com/watch?v=q4ZK6IJCS6Q
Docker básico
https://www.youtube.com/watch?v=SnSH8Ht3MIc
Curso do volodymyr de docker:
https://www.youtube.com/watch?v=eGz9DS-aIeY
Optional (install stuff using ansible)
https://www.youtube.com/watch?v=BeYUQaFS-vg
https://www.youtube.com/watch?v=VANub3AhZpI
