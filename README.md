# Local Telegram Bot API on Render

This repository is a deployment scaffold for the Local Telegram Bot API server.

It uses the `aiogram/telegram-bot-api` Docker image, which packages the official
`tdlib/telegram-bot-api` server. The image is community-maintained; the server
implementation is maintained by TDLib.

## Before deploying

1. Create Telegram API credentials (`api_id` and `api_hash`) in your Telegram
   developer account at https://my.telegram.org.
2. In Render, create a new Web Service from this repository.
3. Choose the Docker runtime and the Free plan.
4. Add these environment variables in Render:
   - `TELEGRAM_API_ID`: your numeric API ID
   - `TELEGRAM_API_HASH`: your API hash
5. Deploy the service.

Do not commit API credentials or bot tokens to this repository.

## Important limitations

- This is only the Local Bot API service. It does not yet connect the existing
  video bot to this server.
- The Local Bot API server returns local filesystem paths in local mode. Because
  the video bot and this service are separate Render services, the integration
  must explicitly transfer the downloaded file between them; simply changing
  the bot API URL is not sufficient.
- Render Free services can sleep and have ephemeral storage. This setup is for
  a test only and is not a reliable always-on production configuration.
- Telegram's Local Bot API supports downloads without the standard hosted API's
  20 MB download limit, and uploads up to 2000 MB. This does not guarantee that
  a free Render instance has enough memory, disk, bandwidth, or uptime for
  250 MB videos.

Do not switch the production bot to this server until the file-transfer
integration has been implemented and tested.
