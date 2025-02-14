FROM node:18-alpine

# Grab needed environment variables from .env.example
ARG NEXT_PUBLIC_GATEWAY_URL_PRODUCTION
ARG NEXT_PUBLIC_WC_PROJECT_ID

ENV NEXT_PUBLIC_GATEWAY_URL_PRODUCTION $NEXT_PUBLIC_GATEWAY_URL_PRODUCTION
ENV NEXT_PUBLIC_WC_PROJECT_ID $NEXT_PUBLIC_WC_PROJECT_ID

RUN apk add --no-cache libc6-compat git python3 py3-pip make g++ libusb-dev eudev-dev linux-headers
WORKDIR /app
COPY . .

# Fix arm64 timeouts
RUN yarn config set network-timeout 300000 && yarn global add node-gyp

# install deps
RUN yarn install --frozen-lockfile
RUN yarn after-install

ENV NODE_ENV production

# Next.js collects completely anonymous telemetry data about general usage.
# Learn more here: https://nextjs.org/telemetry
# Uncomment the following line in case you want to disable telemetry during the build.
ENV NEXT_TELEMETRY_DISABLED 1

EXPOSE 3000

ENV PORT 3000

CMD ["yarn", "static-serve"]
