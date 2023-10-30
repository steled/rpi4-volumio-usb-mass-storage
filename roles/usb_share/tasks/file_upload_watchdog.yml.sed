s/\(- name: add \).*/\1<HOST> to known_hosts file/
s/\(name: l\).*/name: <HOST>/
s/\(key: "{{ lookup('pipe', 'ssh-keyscan -t rsa \).*/\1<HOST>') }}"/