FROM node:21.7.2-bullseye-slim

# Create app directory
RUN mkdir /app/ && chown node:node /app/
WORKDIR /app/

# Install global dependencies
RUN npm install pm2 -g
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y libstdc++6

# Copy and build the front-end
COPY front-end/ /app/front-end/
WORKDIR /app/front-end/
RUN npm install --production 
# RUN npm run-script build

# Switch back to the /app directory
WORKDIR /app/

# Copy the necessary files
COPY --chown=node:node package.json /app/
RUN npm install --production

# Copy the rest of the application files
COPY --chown=node:node *.js *.sh /app/

# Ensure the entrypoint script is executable
RUN chmod +x /app/docker-entrypoint.sh
COPY templates /app/templates

# Use a non-root user
USER node

# Start the server
ENTRYPOINT ["/app/docker-entrypoint.sh"]
