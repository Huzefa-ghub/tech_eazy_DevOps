# Deploying the Java Application with Terraform

This guide explains how to deploy the Java application from this repository onto AWS EC2 using Terraform.

## Prerequisites

Make sure you have:

1. **Terraform**, **Git**, and **VS Code** installed.
2. An **AWS IAM user** with the `AmazonEC2FullAccess` policy attached.
3. An **AWS CLI profile** configured for that IAM user on your local machine.

## Steps

### 1. Create an IAM User

- In AWS Console, go to **IAM > Users > Create user**.
- Give the user a name (no console access needed).
- Click **Next**.
- Attach the policy **AmazonEC2FullAccess**.
- Click **Next** and then **Create user**.
- After creation, click the user name, go to **Security credentials**, and under **Access Keys (0)** click **Create access key**.
- Select the option **CLI (command line interface)**, check the confirmation box, and create the access key.
- **Download the .csv file** containing the Access Key ID and Secret Access Key.

### 2. Configure AWS CLI Profile

On your local machine run:

```bash
aws configure --profile <your-profile-name>
```

Provide:

- AWS Access Key ID
- AWS Secret Access Key
- Default region
- Default output format

Check profiles with:

```bash
aws configure list-profiles
```

### 3. Clone the Repository

```bash
git clone <repository-url>
cd <repository-folder>
```

### 4. Update `main.tf`

- Set the **AWS profile** you created in the provider block. **line no. 3**
- Set the **key_name** variable to your AWS key pair name (the name, not `.pem` filename). *line no. 43*

### 5. Deploy with Terraform

In the Terraform folder:

```bash
terraform init
terraform apply
```

Type `yes` to confirm. Wait ~5 minutes, then open the output URL in your browser.

### 6. Clean Up

After you’re done testing:

```bash
terraform destroy
```

Type `yes` to confirm.

---

This process will spin up an EC2 instance, install Java, Maven, and Git, clone this repository, build the application, and run it on port 80.
