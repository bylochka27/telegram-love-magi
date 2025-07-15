<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Love Magic Mini App</title>
    <script src="https://telegram.org/js/telegram-web-app.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background: #f5f5f5;
            padding: 20px;
        }
        button {
            background: #0088cc;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px;
        }
        pre {
            font-size: 18px;
            line-height: 1.2;
        }
    </style>
</head>
<body>
    <h1>💖 Love Magic 💖</h1>
    <button id="buildBtn">Построить сердце</button>
    <button id="paradeBtn">Цветной парад</button>
    <button id="loveBtn">Признание в любви</button>
    <pre id="output"></pre>

    <script>
        const tg = window.Telegram.WebApp;
        tg.expand(); // Развернуть приложение на весь экран

        const HEART = '🤍';
        const COLORED_HEARTS = ['💗', '💓', '💖', '💘', '❤️', '💞'];
        const PARADE_MAP = `
00000000000
00111011100
01111111110
01111111110
00111111100
00011111000
00001110000
00000100000
`.trim();

        // Генерация цветного парада
        function generateParadeColored() {
            let output = '';
            for (const c of PARADE_MAP) {
                if (c === '0') output += HEART;
                else if (c === '1') output += COLORED_HEARTS[Math.floor(Math.random() * COLORED_HEARTS.length)];
                else output += c;
            }
            return output;
        }

        // Построение сердца
        async function buildHeart() {
            const outputElement = document.getElementById('output');
            let output = '';
            const lines = PARADE_MAP.split('\n');
            
            for (const line of lines) {
                for (const char of line) {
                    output += (char === '0' || char === '1') ? HEART : char;
                    outputElement.textContent = output;
                    await new Promise(resolve => setTimeout(resolve, 20));
                }
                output += '\n';
            }
        }

        // Цветной парад
        async function coloredParade() {
            const outputElement = document.getElementById('output');
            for (let i = 0; i < 50; i++) {
                outputElement.textContent = generateParadeColored();
                await new Promise(resolve => setTimeout(resolve, 100));
            }
        }

        // Признание в любви
        async function loveWords() {
            const outputElement = document.getElementById('output');
            const phrases = [
                "i",
                "i love",
                "i love you",
                "i love you forever",
                "i love you forever💗"
            ];
            
            for (const phrase of phrases) {
                outputElement.textContent = phrase;
                await new Promise(resolve => setTimeout(resolve, 1000));
            }
        }

        // Назначаем обработчики кнопок
        document.getElementById('buildBtn').addEventListener('click', buildHeart);
        document.getElementById('paradeBtn').addEventListener('click', coloredParade);
        document.getElementById('loveBtn').addEventListener('click', loveWords);
    </script>
</body>
</html>
