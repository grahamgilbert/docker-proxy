FROM phusion/passenger-customizable:0.9.16
MAINTAINER Graham Gilbert <graham@grahamgilbert.com>

RUN mkdir -p /etc/my_init.d
ADD etc.d/ /etc/my_init.d/
RUN chmod 755 /etc/my_init.d/render-templates.sh
ADD substitute-env-vars.sh /substitute-env-vars.sh
RUN chmod 755 /substitute-env-vars.sh

CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down


VOLUME ["/var/log/nginx", "/etc/nginx/sites-templates"]
EXPOSE 80 443
