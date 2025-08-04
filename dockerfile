# Use a lightweight official Node.js image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if present) to leverage Docker's caching
# This step allows Docker to only re-run 'npm install' if package.json changes
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Expose the port your Node.js application listens on (e.g., 3000)
EXPOSE 3000

# Define the command to run your application when the container starts
CMD ["node", "index.js"]
