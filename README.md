## repo cloning

- to clone the repo including the submodules use the following command: `git clone <REPO_URL>`
- after you cloned the repo you need to install `transcrypt` (if not installed; to check use `which transcrypt`) and the `pre-commit-sed` hook
- `transcrypt` is used to encrypt sensitive files with a password
- the `pre-commit-sed` git-hook is used to:
    - duplicate sensitive files with a suffix of `.dec`
    - redact the sensitive informations in the unencrypted version of the duplicated file

### transcrypt

- to install `transcrypt` just follow the instructions at: [transcrypt - Usage](https://github.com/elasticdog/transcrypt#usage)
    - transcrypt is installed into folder `/opt/`
- to use the repository and decrypt the files have a look at [trynscrypt - Initialize a Clone of a Configured Repository](https://github.com/elasticdog/transcrypt#initialize-a-clone-of-a-configured-repository)
- the files were decrypted with the following command:

```shell
cd <CLONED_REPO>
transcrypt -c aes-256-cbc -p '<PASSWORD>'
```

### pre-commit-sed git hook

- you can install the hook by running the following command:

```shell
cd <CLONED_REPO>
./bin/create-hook-symlinks
```

## add new sensitive file

- to add a new sensitive file you only need to do the following steps
    - add the new file to the `.gitattributes` file
    - create a `*.sed` file next to the new file
        - create the sed rules
    - push the new file to the repo

## connect to volumio WLAN and configure

- language: Deutsch
- no MyVolumio login
- Name: lailaps
- I2S DAC: IQaudio DAC Plus
- Netzwerk:
    - meadow

## IQaudIO DAC+

The documentation can befound here [IQaudio
Product Guide](https://datasheets.raspberrypi.com/iqaudio/iqaudio-product-brief.pdf)

### SSH
- enable SSH at: http://172.16.2.23/dev/

### Ansible

```bash
---- central01 / steled ----
ssh-keygen -f /home/steled/.ssh/known_hosts -R 172.16.2.23

ansible-playbook -i /ext/repo/gitea_project_automation/ansible/inventories/home/hosts /ext/repo/gitea_project_automation/ansible/lailaps.yml -u volumio --ask-pass --ask-become-pass --become --tags "install"

ansible-playbook -i /ext/repo/gitea_project_automation/ansible/inventories/home/hosts /ext/repo/gitea_project_automation/ansible/lailaps.yml --become --tags "install"

ansible-playbook -i /ext/repo/gitea_project_automation/ansible/inventories/home/hosts /ext/repo/rpi-4-usb-mass-storage/usb_share.yml
```

### Shutdown Button
- activate `System Hardware -> GPIO Buttons` plugin at volumio
- configure `GPIO Pin 5`