#!/bin/bash
# mkdir /etc/varnish


sh /opt/senizm/bin/render_conf.sh < /opt/senizm/bin/conf_${VARNISH_PROFILE}.tmpl > /etc/varnish/backend.vcl
sh /opt/senizm/bin/render_conf.sh < /opt/senizm/bin/default.tmpl > /etc/varnish/default.vcl

varnishd -f /etc/varnish/default.vcl -s malloc,100M -a 0.0.0.0:${VARNISH_PORT} -n varnishuser
sleep 1
chmod 666 /usr/local/var/varnish/varnishuser/_.vsm
varnishlog -n varnishuser  -i BereqURL,Backend,BerespStatus,TTL,Hit,Link