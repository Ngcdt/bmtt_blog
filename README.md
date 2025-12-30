# Blog cá nhân — Lập trình mạng (Java & JavaScript)

Site mẫu Hugo sử dụng theme Ananke. Nội dung bằng tiếng Việt, gồm trang Home, Blog, Profile và 9 bài viết mẫu về Java và JavaScript.

Hướng dẫn nhanh:

1. Cài Hugo (https://gohugo.io/getting-started/quick-start/)
2. Khởi tạo git và thêm theme Ananke:

```bash
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
```

3. Cập nhật `config.toml` (tham khảo file đã có) — đặt `baseURL` và `title`.
4. Chạy site local:

```bash
hugo server -D
```

5. Để deploy lên GitHub Pages, tạo repo trên GitHub, push code và enable Actions (workflow đã thêm sẵn).

Repo hiện tại (hãy đảm bảo bạn push code lên): `https://github.com/Ngcdt/bmtt_blog`

Pages (sau khi Actions deploy): `https://ngcdt.github.io/bmtt_blog/`

Tài nguyên:
- Theme Ananke: https://themes.gohugo.io/themes/gohugo-theme-ananke/


