#!/bin/bash

if [ -n "${USER}" ] && [ -n "${PASS}" ]; then
    htpasswd -cb /etc/nginx/webdavpasswd $USER $PASS
    sed -i 's/#auth_basic/auth_basic/' /etc/nginx/sites-available/default
else
    echo "Warning: No authentication is enforced. Provide environment variables USER and PASS!!!"
fi

nginx