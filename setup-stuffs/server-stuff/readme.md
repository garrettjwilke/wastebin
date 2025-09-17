put wastebin.service in /etc/systemd/system/

```
sudo cp wastebin.service /etc/systemd/system/
```

enable wastebin.service

```
sudo systemctl enable wastebin.service
sudo systemctl start wastebin.service
```
