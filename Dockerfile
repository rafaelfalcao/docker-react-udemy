#PRODUCTION dockerfile - 2 phases
#we ONLY need to copy npm build directory 

FROM node:alpine as builder

WORKDIR '/app'

COPY ./package.json ./
RUN npm install
COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
