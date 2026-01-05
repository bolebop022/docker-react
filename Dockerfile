# Two stage build
# Build phase

# Get base image
FROM node:22-alpine as builder

# Set working directory
WORKDIR /app

# Copy dependency file (package.json)
COPY ./package.json ./

# Install dependencies
RUN npm install

# Copy remaining files
COPY ./ ./

# Build app
RUN npm run build


# Run phase

# Get base image
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
