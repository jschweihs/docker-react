FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

# Copy from previous phase
COPY --from=builder /app/build /usr/share/nginx/html

# Default command from nginx base image starts nginx