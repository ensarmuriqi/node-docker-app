# Use the official Node.js image from the Docker Hub
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and install dependencies
COPY package.json .
RUN npm install

# Copy the application code
COPY . .

# Expose the port that the app will run on
EXPOSE 3000

# Command to start the app
CMD ["npm", "start"]
