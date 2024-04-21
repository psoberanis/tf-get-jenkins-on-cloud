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

4. Get initial admin password, use this command
   ```
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```
6. Install Following plugins after you login to jenkins
   - docker build step
   - docker pipeline
   - delivery pipeline
   - docker common plugins 
