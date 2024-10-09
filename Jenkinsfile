pipeline {
    agent none
    stages {
        stage('Build Terraform Image') {
            agent {
                docker {
                    image 'terraformtest'
                }
            }
            steps {
                script {
                    // Set the working directory to the Terraform directory
                    dir('Terraform') {
                        // Run Terraform commands
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
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
