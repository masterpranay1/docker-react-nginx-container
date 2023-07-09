FROM node:latest
WORKDIR /app
COPY . .
RUN npm ci && npm run build

FROM nginx:alpine 
COPY --from=0 /app/dist /usr/share/nginx/html