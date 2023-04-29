# Use the official Node.js image as the base image
FROM node:16-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files into the container
COPY package*.json ./

# Install dependencies
RUN yarn install

# Copy the rest of the application code into the container
COPY . .

# Build the app for production
RUN yarn run build

# Expose port 3000 for the React.js app
EXPOSE 3000

# Start the app with the production build
CMD [ "yarn", "start" ]