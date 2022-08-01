# =============================================================================
# prepared by: Jitendra (Amazon Linux-Appache-PHP)
#
# AmazonLinux2, Apache 2.4.6-40, PHP 7.4.25
#
# =============================================================================
FROM 205704438450.dkr.ecr.us-east-1.amazonaws.com/arkchat-website-base:latest
 
MAINTAINER Jitendra Bauddha <jitendra.bauddha@gmail.comm

# ----------------------------------------------------------------------------- 
# Remove existing content 
# ----------------------------------------------------------------------------- 
RUN mkdir -p /var/www/html/www.arkchat.com/
RUN mkdir -p /var/www/html/www.arkchat.com/conf
RUN mkdir -p /var/www/html/www.arkchat.com/html
RUN rm -rf /var/www/html/www.arkchat.com/* 
 
# ----------------------------------------------------------------------------- 
# Copy content 
# ----------------------------------------------------------------------------- 
COPY conf/vhosts.conf /etc/httpd/conf.d/ 
COPY . /var/www/html/www.arkchat.com/html/ 
COPY conf/startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh

# ----------------------------------------------------------------------------- 
# Change owner and permission 
# ----------------------------------------------------------------------------- 
 
RUN chown -R apache:apache /var/www/html/www.arkchat.com/
RUN find /var/www/html/www.arkchat.com -type d -exec chmod 755 {} \;
RUN find /var/www/html/www.arkchat.com -type f -exec chmod 644 {} \;

# ----------------------------------------------------------------------------- 
# Remove extra files 
# ----------------------------------------------------------------------------- 
 
RUN rm -rf /var/www/html/www.arkchat.com/conf/* 
RUN rm -rf /var/www/html/www.arkchat.com/Dockerfile
RUN rm -rf /var/www/html/www.arkchat.com/.dockerignore

# ----------------------------------------------------------------------------- 
# Set ports 
# ----------------------------------------------------------------------------- 

EXPOSE 80 443
CMD /root/startup.sh

