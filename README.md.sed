s/\(\-\-\-\- \).*/\1<HOST> \/ <USER>/
s/\(ssh-keygen -f \).*/\1<KNOWN_HOSTS_FILE> -R <HOST_IP>/
s/\/l\(.*\).yml\(.*\)/\/<HOST>.yml\2/