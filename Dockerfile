FROM node:24.15.0-alpine as build
WORKDIR /opt/app
RUN corepack enable
COPY package*.json yarn.lock ./
RUN yarn install --frozen-lockfile
ADD . .
RUN yarn build
COPY public /opt/app/dist/angular-frontend/

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /opt/app/dist/angular-frontend/browser /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
