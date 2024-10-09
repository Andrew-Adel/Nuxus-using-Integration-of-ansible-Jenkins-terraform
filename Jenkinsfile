pipeline {
    agent none
    stages {
        stage('Build Terraform Image') {
            agent {
                docker {
                    image 'terraformtest' // Your Terraform image
                }
            }
            steps {
                script {
                    // Use withCredentials to access AWS credentials
                    withCredentials([
                        string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                        string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY'),
                        string(credentialsId: 'aws-region', variable: 'AWS_REGION') // Optional
                    ]) {
                        // Set environment variables for Terraform
                        sh 'echo "AWS Access Key: $AWS_ACCESS_KEY_ID"'
                        sh 'echo "AWS Secret Access Key: $AWS_SECRET_ACCESS_KEY"'
                        sh 'echo "AWS Region: $AWS_REGION"'

                        // Run Terraform commands
                        dir('Terraform') {
                            sh 'terraform init'
                            sh 'terraform plan'
                            sh 'terraform apply -auto-approve'

                            stash includes: 'inventory', name: 'terraform-inventory'
                        }
                    }
                }
            }
        }
        stage('Run Ansible Playbook') {
            agent {
                docker {
                    image 'ansibletest'
                    args '-u root' // Run the container as root (or specify a user with permissions)
                }
            }
            steps {
                script {
                    unstash 'terraform-inventory'
                    sh 'ls'
                    withCredentials([file(credentialsId: 'Private-key-file', variable: 'SSH_PRIVATE_KEY_FILE')]) {
                       dir('Ansible') {
                            sh '''
                            # List the files for debugging
                            ls

                            # Start the SSH agent
                            eval $(ssh-agent -s)

                            # Set permissions on the SSH key file
                            chmod 600 "$SSH_PRIVATE_KEY_FILE"

                            # Add the private key to the SSH agent
                            ssh-add "$SSH_PRIVATE_KEY_FILE"

                            # Create a temporary directory for Ansible if it doesn't exist
#                            export ANSIBLE_LOCAL_TEMP=${WORKSPACE}/.ansible/tmp
 #                           mkdir -p "$ANSIBLE_LOCAL_TEMP"

                            # Run the Ansible playbook
                            ansible-playbook -i inventory playbook.yml --ssh-extra-args '-o StrictHostKeyChecking=no'                            '''
                            // sshagent(['my-ssh-key']) { // Replace with your credential ID
                            //     sh 'ansible-playbook -i inventory playbook.yml'
                            // }
                        }
                        
                    }
                }
            }
        }
    }
}
