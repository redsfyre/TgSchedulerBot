require 'telegram/bot'
# Token '' işaretleri arasına yazılmalı!
token = 'YOUR_TOKEN_HERE' 

# chat_id için '' işaretine gerek yok
$chatID = CHAT_ID_HERE

# Göndermek istediğiniz mesaj '' işaretleri arasına girilmeli
$message = 'YOUR_MESSAGE_HERE'
Telegram::Bot::Client.run(token) do |bot|
    while true
        r = bot.api.send_message(chat_id: $chatID, text: $message)
        # Mesajın gönderileceği aralık saniye cinsinden girilmeli
        sleep(3600)
    end
end
