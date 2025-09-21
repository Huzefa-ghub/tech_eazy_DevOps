How to Run This Java Application Using terraform.

Prerequisite:
1. Installed Terraform, GIT, VS-code. 
2. have an AWS IAM user Created With "EC2FullAccess" policy attached to it.
3. create a profile in your local computer of that IAM User created. 

Steps:

Step 1: How to create a IAM User .
            goto IAM > Users > create user > name it , "Dont give console access" > press next > attach policies directly > search for "AmazonEC2FullAccess" Check the box of policy > press next > press create user > Click on the created User > click Security credentials > Scroll till 3rd service "Access Keys (0)" > Create access key > Click the radio button "CLI(command line interface)" and scroll down and click on the Checkbox of "I understand" > click next and create access key > Download the .csv File as it contains the Access Key and Access password.

Step 2: Create a AWS profile for the created IAM User.
            aws configure --profile <name of the profile , can be any name>
            AWS Access Key ID [None]:
            AWS Secret Access Key [None]:
            Default region name [None]:
            Default output format [None]:
            aws configure list-profiles #to check if profile was created or not.

Step 3:  Clone the repo to Local.
            git clone <URl> #write in the terminal of VS-code.
            cd 

Step 4:  Now make changes in Main.tf file.
           a. write the profile name that you created in the 3rd line of main.tf file.
           b. write key name of Downloaded key from AWS on line 43.

Step 5:  Now goto the Terraform folder.
            a. terraform init
            b. terraform apply #type "yes" to confirm the command. 
            c. wait atleast 5min then ctrl+click on the URl to access the website.
            d. after successfully accessing the website ,
            e. terraform destroy #type "yes" to confirm the command.


   