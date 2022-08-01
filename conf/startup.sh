#!/bin/bash

#nohup /usr/sbin/rsyslogd -n &

ln -sf /proc/self/fd/1 /var/log/httpd/access_log && \
    ln -sf /proc/self/fd/1 /var/log/httpd/error_log
#    ln -sf /proc/self/fd/1 /var/log/maillog && \
#    ln -sf /proc/self/fd/1 /var/log/messages

postfix start
/usr/sbin/httpd -DFOREGROUND
