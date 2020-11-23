  
#!/bin/bash

# Setup the service to run aec-fan-controller-init.sh on startup
sudo cp *.service /etc/systemd/system

# Enable the service
sudo systemctl enable aec-fac-controller.service

# Reload
sudo systemctl daemon-reload

# Setup the controller
bash aec-fan-controller-init.sh
