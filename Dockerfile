# Uses the community-maintained aiogram image, which packages the official
# tdlib/telegram-bot-api server. The server implementation itself is official.
FROM aiogram/telegram-bot-api:latest

# Render Web Services use port 10000 by default.
# Local mode enables large file downloads and local file paths.
ENV TELEGRAM_LOCAL=1 \
    TELEGRAM_HTTP_IP_ADDRESS=0.0.0.0 \
    TELEGRAM_HTTP_PORT=10000

EXPOSE 10000
