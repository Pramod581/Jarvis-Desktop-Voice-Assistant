#!/bin/bash
apt update -y
apt install python3 python3-pip git -y

cd /home/ubuntu
git clone https://github.com/Pramod581/Jarvis-Desktop-Voice-Assistant.git

REPO_DIR=$(basename https://github.com/Pramod581/Jarvis-Desktop-Voice-Assistant.git .git)
chown -R ubuntu:ubuntu "$REPO_DIR"

MAIN_PY=$(ls /home/ubuntu/$REPO_DIR/*.py | head -n 1)

if [ -f /home/ubuntu/$REPO_DIR/requirements.txt ]; then
    pip3 install -r /home/ubuntu/$REPO_DIR/requirements.txt
fi

cat <<EOF > /etc/systemd/system/app.service
[Unit]
Description=Auto Python App
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/home/ubuntu/$REPO_DIR
ExecStart=/usr/bin/python3 $MAIN_PY
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable app
systemctl start app
