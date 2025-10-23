<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>BunnyChat by Liyana</title>
  <style>
    /* ====== BACKGROUND GRADIENT DAN EFEK ====== */
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #ffe6f2, #ffffff, #ffb6d9);
      background-size: 200% 200%;
      animation: gradientMove 8s ease infinite;
      overflow-x: hidden;
      position: relative;
    }

    @keyframes gradientMove {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    /* ====== EFEK CAHAYA DI TEPI ====== */
    body::before {
      content: "";
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      pointer-events: none;
      box-shadow: inset 0 0 100px 30px rgba(255, 182, 217, 0.5);
      z-index: 1;
    }

    /* ====== HEADER ====== */
    header {
      text-align: center;
      padding: 50px 20px 20px;
      color: #ff66b2;
      position: relative;
      z-index: 2;
    }

    header h1 {
      font-size: 2.5em;
      margin: 0;
      text-shadow: 0 0 10px rgba(255, 128, 171, 0.7);
    }

    header p {
      font-size: 1.1em;
      color: #d63384;
    }

    /* ====== FOTO PROFIL ====== */
    .profile {
      display: flex;
      justify-content: center;
      margin: 20px 0;
      position: relative;
      z-index: 2;
    }

    .profile img {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      border: 4px solid #ffb6d9;
      box-shadow: 0 0 25px rgba(255, 192, 203, 0.8);
    }

    /* ====== BAGIAN KONTEN ====== */
    .content {
      max-width: 700px;
      background: rgba(255, 255, 255, 0.6);
      margin: 30px auto;
      padding: 25px;
      border-radius: 20px;
      box-shadow: 0 0 20px rgba(255, 182, 217, 0.3);
      text-align: center;
      position: relative;
      z-index: 2;
    }

    .content h2 {
      color: #ff66b2;
    }

    .content p {
      color: #7a4069;
      line-height: 1.6;
      font-size: 1em;
    }

    /* ====== TOMBOL ADMIN ====== */
    .admin {
      margin-top: 20px;
    }

    .admin button {
      background-color: #ff66b2;
      border: none;
      color: white;
      padding: 10px 25px;
      border-radius: 25px;
      cursor: pointer;
      font-weight: bold;
      box-shadow: 0 0 15px rgba(255, 128, 171, 0.5);
      transition: all 0.3s ease;
    }

    .admin button:hover {
      background-color: #ff85c1;
      transform: scale(1.05);
      box-shadow: 0 0 20px rgba(255, 182, 217, 0.8);
    }

    /* ====== BUNGA BERTERBANGAN ====== */
    .flower {
      position: absolute;
      width: 30px;
      height: 30px;
      background-image: url('https://cdn-icons-png.flaticon.com/512/4729/4729931.png');
      background-size: cover;
      opacity: 0.8;
      animation: fall linear infinite;
      z-index: 0;
    }

    @keyframes fall {
      0% { transform: translateY(-10%) rotate(0deg); }
      100% { transform: translateY(110vh) rotate(360deg); }
    }
  </style>
</head>
<body>
  <header>
    <h1>🌸 BunnyChat by Liyana 🌸</h1>
    <p>Teman setiamu di saat hari terasa sepi 💖</p>
  </header>

  <div class="profile">
    <img src="https://i.pinimg.com/736x/6e/10/1d/6e101d1f4c8e99e53e9e3cefcfa1f14e.jpg" alt="Foto Profil Liyana">
  </div>

  <div class="content">
    <h2>✨ Tentang Aplikasi ✨</h2>
    <p>
      Hai! Aku <b>Liyana</b>, admin dari <b>BunnyChat</b> — aplikasi lucu yang akan menemanimu
      di saat kamu merasa sepi. Di sini kamu bisa berbagi cerita, mendengarkan musik
      lembut, atau sekadar ngobrol santai dengan AI yang mengerti suasana hatimu 🌷.
    </p>
    <p>
      Dengan desain penuh warna lembut dan bunga yang berterbangan, BunnyChat menciptakan
      suasana yang menenangkan dan hangat — seolah kamu ditemani sahabat sejati yang
      selalu ada untukmu 💌.
    </p>

    <div class="admin">
      <button onclick="alert('Halo, kamu sedang login sebagai Admin Liyana 💕')">Masuk sebagai Admin</button>
    </div>
  </div>

  <!-- ====== BUNGA BERTERBANGAN RANDOM ====== -->
  <script>
    const flowerCount = 20;
    for (let i = 0; i < flowerCount; i++) {
      const flower = document.createElement('div');
      flower.classList.add('flower');
      flower.style.left = Math.random() * 100 + 'vw';
      flower.style.animationDuration = 5 + Math.random() * 5 + 's';
      flower.style.animationDelay = Math.random() * 5 + 's';
      flower.style.transform = rotate(${Math.random() * 360}deg);
      document.body.appendChild(flower);
    }
  </script>
</body>
</html>
