sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -m 0755 -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker > /dev/null

sudo usermod -aG docker $USER > /dev/null

newgrp docker > /dev/null

sudo apt install -y jq > /dev/null


aws ec2 create-tags --resources subnet-05cec4e70581f08ed subnet-0d6f7bb408453c252 subnet-09b4c2f914122d824 subnet-07823edf5927b146c --tags Key=kubernetes.io/cluster/pthangad,Value=shared

# run this command on local system to tunnel remote server to local system
ssh -i ~/.ssh/id_rsa -L 5901:127.0.0.1:5901 -N -f ubuntu@3.144.232.132

tanzu mc create --ui --bind 127.0.0.1:5901 --browser none

tanzu cluster scale tkc-1 -w 3

tanzu cluster kubeconfig get tkc-1 --admin

tanzu config server list

tanzu kubernetes-release get

tanzu cluster delete tkg1 -y -v9

