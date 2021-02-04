
require 'telegram/bot'
# Token '' işaretleri arasına yazılacak
token = 'YOUR_TOKEN_HERE' 

# chat_id için '' işaretine gerek yok
$chatID = CHAT_ID_HERE

# Göndermek istediğin mesajı buraya gir
$message = 'YOUR_MESSAGE_HERE'

Telegram::Bot::Client.run(token) do |bot|
    def mesajGonder(bot)
        while true
        r = bot.api.send_message(chat_id: $chatID, text: $message)
        sleep(10)
        end
    end

    def komutDinle(bot)
        bot.listen do |message|
        case message.text
            
            when '/start'
                bot.api.send_message(chat_id: message.chat.id, text: "Merhaba, görevimi layıkıyla yerine getirebilmek için elimden geldiğince çabalayacağıma emin olabilirsin #{message.from.first_name}")
            when '/stop'
                bot.api.send_message(chat_id: message.chat.id, text: "Ayrıldığımız için üzgünüm #{message.from.first_name} :(")
            when '/help'
                bot.api.send_message(chat_id: message.chat.id, text: "Üzgünüm ama bu botu kullanabilmek için ilgili chat_id bilgisini koda gömmelisiniz")
            end
        end
    end

    t1 = Thread.new{mesajGonder(bot)}
    t2 = Thread.new{komutDinle(bot)}
    t1.join
    t2.join
end
