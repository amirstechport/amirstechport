```markdown
# Check for Updates on All Servers

If you have downloaded the necessary files and ensured they are all in the same directory, you can use the following command to check for updates on all the servers listed in the `sample.ini` file:

```bash
ansible-playbook -i /home/ansible/sample.ini /home/ansible/update.yml
```

## Instructions
1. **Make sure the following files are in the same directory:**
   - `sample.ini`: This is the inventory file with details about the target servers.
   - `update.yml`: This is the Ansible playbook that defines the update tasks for the servers.
   
2. **Run the command in your terminal:**
   Open your terminal and execute the above command to process the servers listed in the `sample.ini` file. This will apply the updates as defined in the `update.yml` file.

3. **Verify the output:**
   Ansible will provide detailed output about the tasks being executed. You can use this to confirm the updates were successful.

## File Breakdown
- **`sample.ini`:** Inventory file that lists all the target servers and their connection details.
- **`update.yml`:** Ansible playbook containing the tasks required to update the servers.

Feel free to modify both `sample.ini` and `update.yml` to match your specific server configuration and update needs.

