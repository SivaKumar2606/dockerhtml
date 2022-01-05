FROM nginx:latest 
MAINTAINER venkatasiva.26689@gmail.com 
RUN apt install -y curl
COPY index.html /usr/share/nginx/html/index.html
COPY scorekeeper.js /usr/share/nginx/html/scorekeeper.js
COPY style.css /usr/share/nginx/html/style.css
#HEALTHCHECK CMD curl --fail http://localhost || exit 1
CMD ["nginx", "-g", "daemon off;"]
