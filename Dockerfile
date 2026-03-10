FROM node:22-alpine

LABEL org.opencontainers.image.source="https://github.com/build25-woodgrove/woodgrove-northwind-secure"
LABEL org.opencontainers.image.description="Secure version of Woodgrove Northwind - blocking Defender CLI demo"

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

USER appuser

EXPOSE 3000

ENV NODE_ENV=production

CMD ["node", "src/app.js"]
