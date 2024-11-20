#!/bin/bash

sudo apt update
sudo apt install -y systemd


mkdir -p /home/ubuntu/folder1
mkdir -p /home/ubuntu/folder2

chown -R ubuntu:ubuntu /home/ubuntu/folder1 /home/ubuntu/folder2
chmod -R 755 /home/ubuntu/folder1 /home/ubuntu/folder2

cat << 'EOF' > /home/ubuntu/move-files.sh
#!/bin/bash
while true; do
    mv /home/ubuntu/folder1/* /home/ubuntu/folder2/ 2>/dev/null
    sleep 1
done
EOF

chown ubuntu:ubuntu /home/ubuntu/move-files.sh
chmod +x /home/ubuntu/move-files.sh

cat << EOF > /etc/systemd/system/move-files.service
[Unit]
Description=Move files from folder1 to folder2
After=network.target

[Service]
ExecStart=/bin/bash /home/ubuntu/move-files.sh
Restart=always
User=ubuntu

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start move-files.service
systemctl enable move-files.service