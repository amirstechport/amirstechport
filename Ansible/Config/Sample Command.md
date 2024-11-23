# Check for Updates on All Servers

If you have downloaded the necessary files and ensured they are all in the same directory, you can use the following command to check for updates on all the servers listed in the `sample.ini` file:

```bash
ansible-playbook -i /home/ansible/sample.ini /home/ansible/update.yml
