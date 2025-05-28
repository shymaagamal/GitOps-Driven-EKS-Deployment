sqp_37b8fd663fb56cff3fdfa589ee60a5911ef25a11

token of project

# if jenkins fails 
sudo apt clean
sudo du -sh /var/lib/jenkins/workspace
sudo rm -rf /var/lib/jenkins/workspace/*
docker system prune -af
sudo systemctl start jenkins
sudo systemctl status jenkins
