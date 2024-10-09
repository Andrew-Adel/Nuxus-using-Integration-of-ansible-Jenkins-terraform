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
        stage('Build Terraform Image') {
            agent {
                docker {
                    image 'terraformtest'  // Replace with your actual Terraform image name
                }
            }
            steps {
                script {
                    // Set the working directory to the Terraform directory
                    dir('Terraform') {
                        // Use withCredentials to securely access AWS config and credentials files
                        withCredentials([
                            file(credentialsId: 'aws-config-file', variable: 'AWS_CONFIG_FILE'),
                            file(credentialsId: 'aws-credentials-file', variable: 'AWS_CREDENTIALS_FILE')
                        ]) {
                            // Create the aws-config directory if it doesn't exist
                            sh 'mkdir -p aws-config'

                            // Copy the AWS config and credentials to the aws-config directory
                            sh 'cp "$AWS_CONFIG_FILE" aws-config/config'
                            sh 'cp "$AWS_CREDENTIALS_FILE" aws-config/credentials'

                            // Run Terraform commands
                            sh 'terraform init'
                            sh 'terraform plan'
                            sh 'terraform apply -auto-approve'
                        }
                    }
                }
            }
        }

        // Uncomment this section if you want to create an inventory file
        // stage('Create Inventory File') {
        //     agent {
        //         docker {
        //             image 'andrewadel/images_for_nexus:latest'
        //         }
        //     }
        //     steps {
        //         // Example command to output inventory file
        //         sh 'terraform output inventory > inventory.txt'
        //         archiveArtifacts artifacts: 'inventory.txt', fingerprint: true
        //     }
        // }

        // Uncomment this section if you want to install Nexus using Ansible
        // stage('Install Nexus using Ansible') {
        //     agent {
        //         docker {
        //             image 'andrewadel/ansible-agent:latest'
        //         }
        //     }
        //     steps {
        //         script {
        //             // Run Ansible playbook to install Nexus
        //             sh 'ansible-playbook install_nexus.yml -i inventory.txt'
        //         }
        //     }
        // }
    }
}
