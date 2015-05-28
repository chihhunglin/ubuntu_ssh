# ubuntu_ssh

  ubuntu 14.10
  
  ssh service

## Usage
To run the image
```sh
docker run -d -P --name ssh chihhunglin/ubuntu_sshd
```
To see the port forwarding
```sh
docker port ssh
```
To login ssh container (password: root)
```sh
ssh root@localhost -p <host port>
```

