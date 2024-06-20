FROM node:20-alpine

WORKDIR /app

COPY . .


RUN npm install
RUN prisma migrate dev --name init p 
RUN npx prisma generate
RUN npm run build

EXPOSE 3000
CMD ["node","dist/index.js"]