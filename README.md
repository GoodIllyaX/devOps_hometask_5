# Hometask #5 (3/10)

## Files
- `userdata.sh`: Script to configure the instance on startup.
- `move-files.sh`: Script executed by the systemd service.

## How to Use
0. run instance:
    - chmod +x create_instance.sh
    - ./create_instance.sh {KEY_NAME} {SECURITY_GROUP_ID} {SUBNET_ID} {IAM_PROFILE_NAME}

1. delete instance:
    - chmod +x delete_instance.sh
    - ./delete_instance.sh {instance-id} 

### ubuntu@ip-172-31-18-134:~$ ls -ld /home/ubuntu/folder1 /home/ubuntu/folder2

- drwxr-xr-x 2 ubuntu ubuntu 4096 Nov 20 23:02 /home/ubuntu/folder1
- drwxr-xr-x 2 ubuntu ubuntu 4096 Nov 20 23:02 /home/ubuntu/folder2

### ubuntu@ip-172-31-18-134:~$ systemctl status move-files.service

- ● move-files.service - Move files from folder1 to folder2 -> Active: active (running) since Wed 2024-11-20 23:02:44 UTC; 51s ago

### ubuntu@ip-172-31-18-134:~$ echo "Test File" > /home/ubuntu/folder1/test.txt
### ubuntu@ip-172-31-18-134:~$ ls /home/ubuntu/folder2

- test.txt
