FROM node:18-alpine AS angular

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm install @angular/cli

EXPOSE 4200

CMD ["npx", "ng", "serve", "--host", "0.0.0.0", "--port", "4200"]
