# =============================================================================
# prepared by: Jitendra (Amazon Linux-Appache-PHP)
#
# AmazonLinux2, Apache 2.4.6-40, PHP 7.4.25
#
# =============================================================================
#FROM 205704438450.dkr.ecr.us-east-1.amazonaws.com/arkchat-website-base:latest
 
FROM 637210537803.dkr.ecr.us-east-1.amazonaws.com/myapp_dev:latest
# ----------------------------------------------------------------------------- 
# Remove existing content 
# ----------------------------------------------------------------------------- 
RUN mkdir -p /var/www/html/
RUN mkdir -p /var/www/html/conf
RUN mkdir -p /var/www/html/html
RUN rm -rf /var/www/html/* 
 
# ----------------------------------------------------------------------------- 
# Copy content 
# ----------------------------------------------------------------------------- 
COPY conf/vhosts.conf /etc/httpd/conf.d/ 
COPY . /var/www/html/ 
COPY conf/startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh

# ----------------------------------------------------------------------------- 
# Change owner and permission 
# ----------------------------------------------------------------------------- 
 
RUN chown -R apache:apache /var/www/html/
RUN find /var/www/html -type d -exec chmod 755 {} \;
RUN find /var/www/html -type f -exec chmod 644 {} \;

# ----------------------------------------------------------------------------- 
# Remove extra files 
# ----------------------------------------------------------------------------- 
 
RUN rm -rf /var/www/html/conf/* 
RUN rm -rf /var/www/html/Dockerfile
RUN rm -rf /var/www/html/.dockerignore

# ----------------------------------------------------------------------------- 
# Set ports 
# ----------------------------------------------------------------------------- 

EXPOSE 80 443
CMD /root/startup.sh

