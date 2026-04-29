## Setting Up Jenkins on an AWS EC2 Instance
This guide provide step-by-step instructions to launch an AWS EC2 Instance, install Jenkins, and access the Jenkins server. Follow these steps to set up a Jenkins server using Amazon Ubuntu on t2.micro instance

## Prerequisites
- An AWS account with appropriate permissions.
- Basic knowledge of SSH and terminal commands.
- A web browser to access the Jenkins dashboard.

## Step 1: Login in to AWS Account
1. Navigate to the [AWS MANAGE CONSOLE](https://aws.amazon.com/free/?trk=06dd4e64-3ddf-405e-bec9-d2414185926c&sc_channel=ps&ef_id=Cj0KCQjw2MbPBhCSARIsAP3jP9w7Vd4XlH7fZH8gZQ51yjxBNYHs9aJ9XJauygSeGaAW8BghZWT4m4waAsqTEALw_wcB:G:s&s_kwcid=AL!4422!3!798628412789!e!!g!!aws!23606217014!196761071947&gad_campaignid=23606217014).
2. Log in with your AWS credentials (username, password, and MFA if enabled).
3. In the AWS Console, locate the EC2 service under the "Compute" section or use the search bar to find "EC2."
4. Click EC2 to access the EC2 Dashboard.

## Step 2: Navigate to EC2 Dashboard
1. In EC2 dashboard, select **Instances** from the left-hand menu.
2. Click **Lauch Instance** to start creating a new EC2 instance.
    <img src="/home/namdh/AWS_Labs/Jenkins/images/image.png">

## Step 3: Launch Instance
1. Configure infor of EC2 the following:
- **Name**: Enter Jenkin_server
- **Number of instance**: Set to ``1``
- **Amazon Machine Image (AMI)**: Choose Ubuntu Pro - Ubuntu Server Pro 22.04 LTS  (HVM), SSH Volume Type (Free tier eligible).
- **Architecture**: Seclect 64-bit (x86)

## Step 4: Confguire Instance
1. Instance Type: Select t3.micro (Free tier eligible, 2 vCPU, 1GiB memory).
2. Key Pair:
- If you have an exisiting key pair, select it from the dropdown.
- If not, click Create new key pair, name(e.g. jekins-key), choose RSA and .pem format, and download the key pair. Store it securely.
3. Leave default setting for storage unless specific requirement exist.
4. Proceed to configure network settings.
    <img src="/home/namdh/AWS_Labs/Jenkins/images/image-1.png">

## Step 5: Configure Network Security Groups
1. In the Network settings section:
    - Choose Create security group or select an existing one.
    - Add the following inbound rules:
        - Type: HTTP, Protocol: TCP, Port Range: 8080, Source: Anywhere (0.0.0.0/0) for Jenkins web access.
        - Type: SSH, Protocol: TCP, Port Range: 22, Source: Your IP or Anywhere (0.0.0.0/0) for SSH access.
    - Security Note: Allowing all traffic (0.0.0.0/0) for all ports is insecure. For production, restrict SSH to your IP and limit other traffic.
2. Ensure port 8080 (Jenkins) and port 22 (SSH) are open.
    <img src="/home/namdh/AWS_Labs/Jenkins/images/image-2.png">

## Step 6: Connect to EC2 Instance
1. In the EC2 Dashboard, go to Instances and wait for the instance to reach the Running state (verify "Status Checks" pass).
2. Select the instance (my_jenkins_server)
    <img src="/home/namdh/AWS_Labs/Jenkins/images/image-4.png">

# Step 7: Install Jenkins
1. Using bashscript jenkins-install.sh

👉 Jenkins runs on http://:8080 \
    <img src="/home/namdh/AWS_Labs/Jenkins/images/image-3.png">

2. Get initial password: \
    ```sudo cat /var/lib/jenkins/secrets/initialAdminPassword```

    <img src="/home/namdh/AWS_Labs/Jenkins/images/image-5.png">


    <img src="/home/namdh/AWS_Labs/Jenkins/images/image-6.png">

    <img src="/home/namdh/AWS_Labs/Jenkins/images/image-7.png">


    <img src="/home/namdh/AWS_Labs/Jenkins/images/image-8.png">