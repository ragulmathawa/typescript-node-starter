# Stage 1: Compiling src files
FROM node:10.16.2-alpine as builder

# Create app directory
WORKDIR /usr/src/app

RUN apk add --no-cache --virtual .gyp python g++ 
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY ./package*.json ./

RUN npm install && apk del .gyp
    
    
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY ./ .

RUN npm run build

# Stage 2 - Creating Prod Image
FROM node:10.16.2-alpine
WORKDIR /usr/src/app

RUN apk add --no-cache --virtual .gyp python g++ 

COPY package*.json ./
RUN npm install && apk del .gyp
COPY --from=builder /usr/src/app/build /usr/src/app/.

CMD ["node", "index.js"]
