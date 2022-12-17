FROM node:16

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# If you are building your code for production
# RUN npm ci --only=production

EXPOSE 3001