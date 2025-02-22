FROM ubuntu:latest
# FROM php:8.0.30-apache

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

#Install Cron
RUN apt-get update && apt-get -y install cron

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
