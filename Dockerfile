FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#/app/build <-- has everything we will need in the run phase

#from statements are terminating each successive block
FROM nginx

#elasticbeanstalk looks for this port, other things don't
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html
#default command for nginx is already start
