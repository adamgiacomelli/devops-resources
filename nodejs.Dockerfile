# This should be reviewed on a per-application basis
# The container should be run with the --init flag to ensure node PID 0 for smooth container startup & termination
FROM node:12.9.1-slim

WORKDIR /app

# install dependencies
COPY package.json yarn.lock /app/
RUN yarn install --pure-lockfile

# copy all other files
COPY . /app

RUN yarn build
EXPOSE 80

# run the application
CMD ["node", "-r", "dist/main.js"]
