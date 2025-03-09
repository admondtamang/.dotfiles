FROM node:lts-alpine3.17 as base

FROM base as builder

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Bundle app source
COPY . .

# Generate prisma client
RUN yarn prisma:generate

# Build app
RUN yarn build

FROM base as prod

# Create app directory
WORKDIR /usr/src/app

ENV NODE_ENV=production

COPY --from=builder /app/node_modules ./node_modules 

COPY package.json yarn.lock ./
RUN yarn install --production
COPY --from=builder /app/dist ./
COPY --from=builder /app/prisma ./prisma
RUN yarn prisma:generate

RUN addgroup -g 1001 -S nodejs
RUN adduser -S appuser -u 1001
RUN mkdir -p /usr/src/app/uploads
RUN chown -R appuser:nodejs /usr/src/app
USER axp

# Expose port
EXPOSE 8080

# Start app
CMD [ "node", "/usr/src/app/index.js" ]