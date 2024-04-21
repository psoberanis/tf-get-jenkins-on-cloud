# tf-get-jenkins-on-cloud
  
This terraform code will install Jenkins in cloud and get you IP and URL details on terminal. 

1. Please modify your provider section with your lab specific detais

2. Run following command
   ```
   terraform init
   ```
   ```
   terraform plan
   ```
   ```
   terraform apply
    ```
   You should get IP add from the terminal where terraform was executed.
   Note that it takes time. 
   ![image](https://github.com/jvsocial/tf-get-jenkins-on-cloud/assets/78414554/53667dd0-1f39-4234-bc06-b88661798ad7)

   Check jenkins on ip with port 8080
   ![image](https://github.com/jvsocial/tf-get-jenkins-on-cloud/assets/78414554/b468dd65-c85f-424e-9592-fbc244f0c79a)

   
4. Get initial admin password, use this command
   ```
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```

   above command are run in EC2 VM. there are various ways to connect to VM terminal.

   Click on Connect
   ![image](https://github.com/jvsocial/tf-get-jenkins-on-cloud/assets/78414554/eb9c9a54-daad-4b00-81b4-aac226f5d33c)


   ![image](https://github.com/jvsocial/tf-get-jenkins-on-cloud/assets/78414554/5e532f43-c711-4eb6-af7e-fc80f9ff3d2b)

   ![image](https://github.com/jvsocial/tf-get-jenkins-on-cloud/assets/78414554/49ccc60e-8084-42a2-be67-618a5746e098)

5. Delivery details
   - VM EC2 Created 
   - Ansible installed
   - Jenkins installed using Ansbile 

   
7. Install Following plugins after you login to jenkins
   - docker pipeline
   - delivery pipeline
   - docker common plugins 
