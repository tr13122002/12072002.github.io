<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
  <title>Hiệu ứng yêu thương</title>
  <style>
    html, body {
      margin: 0;
      padding: 0;
      background: black;
      overflow: hidden;
      height: 100%;
      font-family: 'Arial', sans-serif;
      touch-action: manipulation;
    }

    .text, .heart {
      position: absolute;
      color: #ff99ff;
      font-weight: bold;
      white-space: nowrap;
      text-shadow: 0 0 10px #ff99ff, 0 0 20px #ff99ff;
      animation: fall linear forwards;
      z-index: 1;
    }

    .heart {
      color: #ff3366;
      text-shadow: 0 0 8px #ff3366, 0 0 15px #ff3366;
    }

    @keyframes fall {
      0% {
        transform: translateY(-50px);
        opacity: 0;
      }
      10% {
        opacity: 1;
      }
      100% {
        transform: translateY(110vh);
        opacity: 0;
      }
    }

    audio {
      display: none;
    }
  </style>
</head>
<body>

<!-- Nhạc nền -->
<audio id="bgMusic" autoplay loop>
  <source src="music.mp3" type="audio/mpeg" />
  Trình duyệt không hỗ trợ audio.
</audio>

<script>
    const texts = [
        "Chúc em yêu của anh ngày 1/6 vui vẻ",
        "Cảm ơn vì em đã đến 💖",
        "Anh sẽ luôn bên cạnh em",
        "Anh yêu em nhiều lắm",
        "Nơi nào đều có 2 ta, chắc chắn",
        "Đào Trung Hiếu 💖 Nguyễn Thị Trang",
    ];

    // Tạo hiệu ứng chữ rơi
    function createFallingText() {
        const el = document.createElement("div");
        el.className = "text";
        el.innerText = texts[Math.floor(Math.random() * texts.length)];
        el.style.fontSize = (Math.random() * 2 + 2) + "vw"; // font theo tỉ lệ màn hình
        el.style.left = Math.random() * 90 + "vw";
        el.style.animationDuration = (Math.random() * 5 + 6) + "s";
        document.body.appendChild(el);
        setTimeout(() => el.remove(), 15000);
    }

    // Tạo hiệu ứng tim rơi
    function createFallingHeart() {
        const el = document.createElement("div");
        el.className = "heart";
        el.innerText = "❤";
        el.style.left = Math.random() * 100 + "vw";
        el.style.fontSize = (Math.random() * 3 + 2) + "vw"; // font theo màn hình
        el.style.animationDuration = (Math.random() * 5 + 5) + "s";
        document.body.appendChild(el);
        setTimeout(() => el.remove(), 15000);
    }

    // Tạo liên tục
    setInterval(createFallingText, 600);
    setInterval(createFallingHeart, 250);

    // Tự phát nhạc sau chạm
    document.addEventListener("click", () => {
        const music = document.getElementById("bgMusic");
        if (music.paused) music.play();
    });
</script>

</body>
</html>
