#!/bin/bash
# This bash script is used for installing ansible on CentOS 8 which will configure VMs on proxmox
sudo dnf update -y
sudo dnf install sshpass -y
sudo dnf install epel-release -y
sudo dnf install ansible -y
sudo echo "[pvenodes]
192.168.40.20" > inventory
sudo echo "[defaults]
interpereter_python=auto_silent
host_key_checking=False" > ansible.cfg
ansible pvenodes -i inventory -m ping --user=root -k
sudo echo "- hosts: pvenodes
  tasks:

  - name: install sudo package
    apt:
      name: sudo
      update_cache: yes
      cache_valid_time: 3600
      state: latest

  - name: create Ansible user
    user:
      name: ansible
      shell: '/bin/bash'

  - name: add Ansible ssh key
    authorized_key:
      user: ansible
      key: "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC0OpBu+tPz30st2o9lt8ZO1GxoclRI1VD0FMQ/pHKw+ root@ansible"

  - name: add ansible to sudoers
    copy:
      src: sudoer_ansible
      dest: /etc/sudoers.d/ansible
      owner: root
      group: root
      mode: 0440" > pve_onboard.yml
mkdir files
echo "ansible ALL=(ALL) NOPASSWD: ALL" > files/sudoer_ansible
ansible-playbook pve_onboard.yml -i inventory --user=root -k
ansible pvenodes -m ping -i inventory --user=ansible  --private-key ~/.ssh/ansible-key
echo "- hosts: pvenodes
  become: true
  tasks:

  - name: update repository cache
    apt:
      update_cache: yes
      cache_valid_time: 3600

  - name: install proxmoxer
    apt:
      name:
      - python3-proxmoxer
      state: latest" > pve_install_proxmoxer.yml
ansible-playbook pve_install_proxmoxer.yml -i inventory --user=ansible --private-key ~/.ssh/ansible-key
echo "- hosts: 192.168.102.10
  become: false
  gather_facts: false
  tasks:

  - name: Create new vm with minimal options
    vars:
      ansible_python_interpreter: /usr/bin/python3
    proxmox_kvm:
      api_user: ansible@pam
      api_token_id: ansible-token
      api_token_secret: 7a4c9e2f-fede-417b-b0e8-d3cbaed5c5ad
      api_host: 192.168.102.10
      node: pvedemo1
      name: vmtest" > pve_create_vm.yml
ansible-playbook pve_create_vm.yml -i inventory --user=ansible --private-key ~/.ssh/ansible-key
