FROM node:alpine as builder
WORKDIR '/app'
COPY 'package.json' .
RUN npm install
COPY . .
RUN npm run build

# from starts a new phase
FROM nginx
COPY --from=builder /app/build usr/share/nginx/html
# no need for a run command as the nginx image does it on its own



