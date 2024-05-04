FROM node:latest
RUN apt-get update && apt-get install -y git
WORKDIR /app
RUN git clone https://github.com/Hek70r/node-multiplayer-snake.git
WORKDIR /app/node-multiplayer-snake
RUN npm install
