# 🎓 GoLearn — Uzaktan Eğitim Platformu API

**Öğrenci Adı Soyadı:** Esma Balıkçı  
**Öğrenci Numarası:** 24080410019  

GoLearn; öğretmenlerin kurs oluşturabildiği, öğrencilerin bu kurslara katılıp dersleri takip edebildiği ve quizler ile kendilerini test edebildiği modern bir REST API projesidir. Proje, gerçek zamanlı sınıf (WebSocket) ve konteynerizasyon (Docker) gibi ileri seviye özellikleri barındırmaktadır.

---

## 🚀 Teknik Özellikler & Gereksinimler

- **Dil:** Go (Golang) 1.24+
- **Framework:** [Gin Gonic](https://gin-gonic.com/)
- **ORM:** [GORM](https://gorm.io/) (SQLite sürücüsü ile)
- **Güvenlik:** 
  - `bcrypt` ile şifre hashleme
  - `jwt-v5` ile token tabanlı kimlik doğrulama
  - **RBAC:** Öğretmen ve Öğrenci rolleri arası yetkilendirme (TeacherOnly guard)
- **Dayanıklılık:**
  - **Rate Limiting:** IP bazlı istek sınırlama (Token Bucket algoritması)
  - **Hata Yönetimi:** Standart HTTP status kodları ve anlaşılır JSON yanıtları

---

## 🛠 Proje Mimarisi

Proje, Go'nun en iyi pratiklerine (Idiomatic Go) uygun modüler bir yapıda kurulmuştur:

- `main.go`: API route tanımları ve sunucu başlangıcı.
- `handlers/`: İş mantığının (CRUD, Auth, WebSocket) bulunduğu katman.
- `models/`: Veritabanı tablolarını temsil eden GORM struct'ları.
- `middleware/`: Auth, CORS, RBAC ve Rate Limit işlemleri.
- `database/`: SQLite bağlantısı ve AutoMigrate konfigürasyonu.
- `docs/`: Swagger (OpenAPI) dokümantasyon dosyaları.

---

## 📡 API Uç Noktaları (Endpoints)

### 🔒 Kimlik Doğrulama
- `POST /api/auth/register` - Yeni kullanıcı kaydı (teacher/student)
- `POST /api/auth/login` - Giriş yap ve JWT Token al

### 📚 Kurs Yönetimi
- `GET /api/courses` - Tüm kurslar (Sayfalama ve Kategori filtreleme desteği)
- `GET /api/courses/:id` - Kurs detayı ve ders listesi
- `POST /api/courses` - Yeni kurs oluştur (**Sadece Öğretmen**)
- `PUT /api/courses/:id` - Kurs güncelle (**Sadece Kurs Sahibi**)
- `DELETE /api/courses/:id` - Kurs sil (**Sadece Kurs Sahibi**)

### 📝 Dersler & Quiz
- `POST /api/courses/:id/lessons` - Kursa ders ekleme
- `POST /api/lessons/:id/quiz` - Derse quiz ekleme
- `POST /api/quiz/:id/submit` - Quiz çözme ve otomatik puanlandırma (Min %70 başarı)

### 📈 İlerleme & İletişim
- `GET /api/my/progress` - Öğrenci gelişim raporu
- `POST /api/lessons/:id/complete` - Dersi tamamlandı olarak işaretleme
- `WS /ws/classroom/:courseId` - Canlı sınıf içi gerçek zamanlı sohbet

---

## 🐳 Docker ile Çalıştırma

Projeyi herhangi bir bağımlılık kurmadan Docker üzerinden ayağa kaldırabilirsiniz:

```bash
# Projeyi derle ve başlat
docker compose up --build -d

# API adresi: http://localhost:8090
# Swagger adresi: http://localhost:8090/swagger/index.html
```

---

## 📝 Dokümantasyon
Tüm API uç noktalarını görsel olarak test etmek için Swagger UI kullanılabilir:
👉 [http://localhost:8090/swagger/index.html](http://localhost:8090/swagger/index.html)

---
*Bu proje, Web Tabanlı Programlama dersi "Finale Doğru Seri 2" ödevi kapsamında geliştirilmiştir.*
