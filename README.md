# GoLearn Uzaktan Eğitim Platformu API

**Öğrenci Adı Soyadı:** Esma
**Öğrenci Numarası:** 324

Bu proje, Go (Golang) ile geliştirilmiş bir uzaktan eğitim platformu REST API'sidir. Gin framework'ü, GORM ve SQLite kullanılarak inşa edilmiştir. Rol tabanlı erişim, kimlik doğrulama, quiz sistemi, ders ilerleme takibi ve hata yönetimi özelliklerini barındırır. Web soket ile canlı yayın yapısına ve Swagger dokümantasyonuna sahiptir.

## Özellikler
- **Kimlik Doğrulama (Auth) & Güvenlik:** `bcrypt` ve `jwt-v5` 
- **RBAC:** Öğretmen yetkisine sahip kullanıcılar (`TeacherOnly` middleware).
- **Course CRUD:** Kursların silme ve güncelleme işlemlerinde `Owner Check`.
- **Quiz:** Quiz oluşturulup `SubmitQuiz` işleminin gelen şıklarla otomatik karşılaştırılması ve otomatik puanlanması.
- **Progress:** İzlenen derslerin upsert kuralıyla işaretlenip kurs bazlı yüzdelik hesaplama yapılması.
- **Sayfalandırma (Pagination):** `page`, `limit`, `category` ve `sort` özelliklerini destekleyen filtreleme yapısı.
- **WebSocket:** Anlık sohbet odaları eşzamanlılıktan (concurrency) korunmuş, güvenli mesajlaşma servisi.
- **Ratellimit:** IP başına (`ratelimit.go`)
- **Altyapı:** Swagger ve Docker.
