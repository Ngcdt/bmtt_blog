---
title: "Java: Socket TCP — Client/Server"
date: "2025-12-30T12:32:00+07:00"
draft: false
tags: ["Java","Socket","TCP"]
categories: ["Java","Mạng"]
---
TCP (Transmission Control Protocol) cung cấp kết nối tin cậy giữa hai endpoint. Trong Java, `ServerSocket` và `Socket` là hai lớp cốt lõi để xây dựng ứng dụng TCP.

Nội dung chính:
- Tạo `ServerSocket` lắng nghe cổng, chấp nhận kết nối và spawn thread xử lý từng client.
- Tạo `Socket` ở phía client, nối đến server và trao đổi dữ liệu bằng luồng Input/Output.
- Xử lý timeout, đóng kết nối an toàn và quản lý lỗi I/O.

Ví dụ kèm mã nguồn minh hoạ server đa luồng và client đơn giản để bạn thực hành.


