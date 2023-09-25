# Web Application Security Automation #

Using the Terraform and Ansible to automate the follow tasks:

* Deploy a Nginx reverse proxy
* Nginx Hardening 
* Install and configure Letsencrypt
* Install and configure the OSSEC HIDS

## Install ##
git clone https://github.com/alexoslabs2/wapautomation.git

### Terraform ###

The terraform is using the Digital Ocean provider
>
>export DO_PAT="your_personal_access_token"
>

### Ansible ###

Letsencrypt

Edit the ansible/reverseproxy/roles/letsencrypt/defaults/main.yml file

>letsencrypt_account_email: "exemple@domain.com"

>letsencrypt_cert:
>  name: example.com #Set the domain  
>
>  domains:
>    - example.com.br #Set the domain aliases
    
### Nginx ###

Edit the ansible/reverseproxy/roles/nginx/defaults/main.yml file

> nginx_revproxy_sites:                                        
>  example.com:   #Set the domain                                             
>    client_max_body_size: "256M"
>    proxy_read_timeout: "360"
>    domains:                                                  
>      - example.com #Set the domain aliases
>    upstreams:                                               
>      - {backend_address: 1.1.1.1, backend_port: 80} #Set the backend IP

### OSSEC HIDS ###

Edit the ansible/reverseproxy/roles/ossec/defaults/main.yml file

> ossec_email_address: user@domain.com  #Set alerts reciepient

Reverse proxy's playbook example
> -hosts: all
>  
>  become: yes
>
>  roles:
>
>   -nginx
>  
>   -nginx-hardening
>  
>   -letsencrypt
>  
>   -ossec

  
 
