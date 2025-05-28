sqp_4804ed2d59c46172009e8662d483c2ebe21d1ea7 

token of project

# if jenkins fails 
sudo apt clean
sudo du -sh /var/lib/jenkins/workspace
sudo rm -rf /var/lib/jenkins/workspace/*
docker system prune -af
sudo systemctl start jenkins
sudo systemctl status jenkins
