# mail-alert

Simple container with smtp configured to send mail-alerts.

Adjust [settings](settings) and revaliases accordingly.


To send mail, simply run

```bash
docker-compose run mail-alert bash -c "echo 'Hello' | mail -s 'TEST' -r sender@mail.com some@mail.com"
```
