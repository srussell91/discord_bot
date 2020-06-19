FROM python:3.8

# Set URL for Anchorman API and token for Discord API
ARG anchorman_url
ENV ANCHORMAN_API_URL=$anchorman_url

ARG discord_token
ENV DISCORD_BOT_TOKEN=$discord_token

# Create app directory
WORKDIR /app

# Install app dependencies
COPY src/requirements.txt ./

RUN pip install -r requirements.txt

# Bundle app source
COPY src /app

EXPOSE 8080
CMD [ "python", "bot.py" ]