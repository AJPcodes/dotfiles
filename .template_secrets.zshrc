# Filename .secrets.zshrc

export OBAN_KEY_FINGERPRINT="secret"
export OBAN_LICENSE_KEY="secret"


alias db-ssh="sshuttle -r aphelps@actual.ip.address --subnets ~/.ssh/db_hosts.txt"