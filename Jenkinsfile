// pipeline {
//     agent none
//     stages {
//         stage('Build Terraform Image') {
//             agent {
//                 docker {
//                     image 'terraformtest'
//                 }
//             }
//             steps {
//                 script {
//                     // Set the working directory to the Terraform directory
//                     dir('Terraform') {
//                         // Copy AWS config and credentials files
//                         withCredentials([file(credentialsId: 'aws-config-file', variable: 'AWS_CONFIG_FILE'),
//                                         file(credentialsId: 'aws-credentials-file', variable: 'AWS_CREDENTIALS_FILE')]) {
//                             // Create the aws-config directory if it doesn't exist
//                             sh 'mkdir -p aws-config'

//                             // Copy the AWS config and credentials to the aws-config directory
//                             sh "cp $AWS_CONFIG_FILE aws-config/config"
//                             sh "cp $AWS_CREDENTIALS_FILE aws-config/credentials"

//                             // Run Terraform commands
//                             sh 'terraform init'
//                             sh 'terraform plan'
//                             sh 'terraform apply -auto-approve'
//                         }
//                     }
//                 }
//             }
//         }
//         // stage('Create Inventory File') {
//         //     agent {
//         //         docker {
//         //             image 'andrewadel/images_for_nexus:latest'
//         //         }
//         //     }
//         //     steps {
//         //         // Example command to output inventory file
//         //         sh 'terraform output inventory > inventory.txt'
//         //         archiveArtifacts artifacts: 'inventory.txt', fingerprint: true
//         //     }
//         // }
//         // stage('Install Nexus using Ansible') {
//         //     agent {
//         //         docker {
//         //             image 'andrewadel/ansible-agent:latest'
//         //         }
//         //     }
//         //     steps {
//         //         script {
//         //             // Run Ansible playbook to install Nexus
//         //             sh 'ansible-playbook install_nexus.yml -i inventory.txt'
//         //         }
//         //     }
//         // }
//     }
// }

pipeline {
    agent none
    stages {
        // stage('Build Terraform Image') {
        //     agent {
        //         docker {
        //             image 'terraformtest' // Your Terraform image
        //         }
        //     }
        //     // steps {
        //     //     // script {
        //     //     //     // Set a temporary directory for AWS config files
        //     //     //     def tempDir = "${env.WORKSPACE}/Terraform/aws-config"
        //     //     //     sh "mkdir -p ${tempDir} && chmod 777 ${tempDir}" // Create and set permissions
        //     //     //     // Use withCredentials to securely access AWS config and credentials files
        //     //     //     withCredentials([
        //     //     //         file(credentialsId: 'aws-config-file', variable: 'AWS_CONFIG_FILE'),
        //     //     //         file(credentialsId: 'aws-credentials-file', variable: 'AWS_CREDENTIALS_FILE')
        //     //     //     ]) {
        //     //     //         // Copy the AWS config and credentials to the temporary directory
        //     //     //         sh "cp \"$AWS_CONFIG_FILE\" ${tempDir}/config"
        //     //     //         sh "cp \"$AWS_CREDENTIALS_FILE\" ${tempDir}/credentials"

        //     //     //         // Set environment variables for Terraform to read the AWS config
        //     //     //         sh "export AWS_CONFIG_FILE=${tempDir}/config"
        //     //     //         sh "export AWS_SHARED_CREDENTIALS_FILE=${tempDir}/credentials"

        //     //     //         // Run Terraform commands
        //     //     //         dir('Terraform') {
        //     //     //             sh 'terraform init'
        //     //     //             sh 'terraform plan'
        //     //     //             sh 'terraform apply -auto-approve'
        //     //     //             // sh 'sleep 30'
        //     //     //             // sh 'terraform destroy -auto-approve'
        //     //     //         }
        //     //     //     }
        //     //     // }
        //     //     script {
        //     //         // Use withCredentials to securely access AWS credentials
        //     //         withCredentials([
        //     //             string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
        //     //             string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
        //     //         ]) {
        //     //             // Set environment variables for Terraform to read the AWS config
        //     //             // Terraform will automatically use these environment variables
        //     //             env.AWS_ACCESS_KEY_ID = "${AWS_ACCESS_KEY_ID}"
        //     //             env.AWS_SECRET_ACCESS_KEY = "${AWS_SECRET_ACCESS_KEY}"

        //     //             // Run Terraform commands
        //     //             dir('Terraform') {
        //     //                 sh 'terraform init'
        //     //                 sh 'terraform plan'
        //     //                 sh 'terraform apply -auto-approve'
        //     //             }
        //     //         }
        //     //     }
        //     // }
        //     steps {
        //         script {
        //             // Use withCredentials to access AWS credentials
        //             withCredentials([
        //                 string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
        //                 string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY'),
        //                 string(credentialsId: 'aws-region', variable: 'AWS_REGION') // Optional
        //             ]) {
        //                 // Set environment variables for Terraform
        //                 sh 'echo "AWS Access Key: $AWS_ACCESS_KEY_ID"'
        //                 sh 'echo "AWS Secret Access Key: $AWS_SECRET_ACCESS_KEY"'
        //                 sh 'echo "AWS Region: $AWS_REGION"'

        //                 // Run Terraform commands
        //                 dir('Terraform') {
        //                     sh 'terraform init'
        //                     sh 'terraform plan'
        //                     sh 'terraform apply -auto-approve'
        //                 }
        //             }
        //         }
        //     }
        // }
        stage('Run Ansible Playbook') {
            agent {
                docker {
                    image 'ansibletest'
                    args '-u root' // Run the container as root (or specify a user with permissions)
                }
            }
            steps {
                script {
                    // Use withCredentials to securely access SSH private key
                    // withCredentials([sshUserPrivateKey(credentialsId: 'my-ssh-key', keyFileVariable: 'SSH_PRIVATE_KEY', usernameVariable: 'SSH_USER')]) {
                    withCredentials([file(credentialsId: 'Private-key-file', variable: 'SSH_PRIVATE_KEY_FILE')]) {
                        // Ensure the SSH agent is started
                        // sh 'eval $(ssh-agent -s)'
                        // sh "echo \"${SSH_PRIVATE_KEY}\" | tr -d '\\r' | ssh-add -"

                        // // Debugging: Check SSH_USER
                        // echo "SSH User: ${SSH_USER}"

                        // // Run your Ansible playbook
                        // sh "ansible-playbook -i inventory_file playbook.yml --private-key=${SSH_PRIVATE_KEY}"
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
                            export ANSIBLE_LOCAL_TEMP=${WORKSPACE}/.ansible/tmp
                            mkdir -p "$ANSIBLE_LOCAL_TEMP"

                            # Run the Ansible playbook
                            ansible-playbook -i inventory playbook.yml --ssh-extra-args '-o StrictHostKeyChecking=no'
                            '''
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
