---
title: "Java: Xử lý đa luồng trong ứng dụng mạng"
date: "2025-12-30T12:36:00+07:00"
draft: false
tags: ["Java","Multithreading"]
categories: ["Java"]
---
Đa luồng là thành phần thiết yếu khi xây dựng server hiệu năng cao. Bài viết này trình bày:

- Khái niệm `Thread` và `Runnable` trong Java
- Sử dụng `ExecutorService` để quản lý pool thread
- Đồng bộ hoá dữ liệu chia sẻ, tránh race condition bằng `synchronized` và `Concurrent` collections
- Thiết kế server đa luồng: accept loop, worker threads và xử lý I/O không đồng bộ

Kèm theo bài tập: xây dựng thread-pool server xử lý nhiều client đồng thời.


