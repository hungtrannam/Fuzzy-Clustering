# Phân Cụm Fuzzy C-Means bằng MATLAB

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![MATLAB](https://img.shields.io/badge/MATLAB-R2018b%2B-orange.svg)

## Giới Thiệu

Dự án này cung cấp một triển khai thuật toán phân cụm Fuzzy C-Means (FCM) bằng MATLAB. Thuật toán FCM phân chia một tập hợp các điểm dữ liệu thành `c` cụm, trong đó mỗi điểm dữ liệu có mức độ thuộc về mỗi cụm. Mã nguồn này thực hiện phân cụm trên một tập dữ liệu nhỏ và trực quan hóa kết quả để giúp bạn hiểu rõ hơn về cách thuật toán hoạt động.

## Mục Lục

- [Giới Thiệu](#giới-thiệu)
- [Mô Tả Mã](#mô-tả-mã)
- [Cách Sử Dụng](#cách-sử-dụng)
- [Cài Đặt](#cài-đặt)
- [Câu Hỏi Thường Gặp](#câu-hỏi-thường-gặp)
- [Đóng Góp](#đóng-góp)
- [Vấn Đề](#vấn-đề)
- [Giấy Phép](#giấy-phép)
- [Liên Hệ](#liên-hệ)

## Mô Tả Mã

Mã nguồn thực hiện các bước sau:

1. **Khởi tạo:**
   - Định nghĩa dữ liệu đầu vào và các trung tâm cụm ban đầu.
   - Cài đặt các tham số cho số vòng lặp tối đa và tiêu chí hội tụ.

2. **Quá Trình Phân Cụm:**
   - Tính khoảng cách giữa từng điểm dữ liệu và mỗi trung tâm cụm.
   - Cập nhật giá trị thuộc về cụm dựa trên khoảng cách.
   - Cập nhật trung tâm cụm dựa trên giá trị thuộc về cụm.

3. **Trực Quan Hóa:**
   - Vẽ biểu đồ phân tán các điểm dữ liệu và trung tâm cụm trong quá trình lặp.
   - Kết quả phân cụm cuối cùng với các trung tâm cụm và các đường viền mức độ thuộc về cụm.

## Cách Sử Dụng

1. Sao chép mã MATLAB vào một tệp script (ví dụ: `fcm_clustering.m`).
2. Chạy script trong MATLAB.
3. Script sẽ thực hiện phân cụm Fuzzy C-Means trên tập dữ liệu mẫu và tạo các đồ thị hiển thị quá trình phân cụm và kết quả.

## Cài Đặt

Để sử dụng mã này, bạn cần có MATLAB (R2018b hoặc phiên bản mới hơn) được cài đặt trên máy tính của bạn.

## Câu Hỏi Thường Gặp

**Q1: Mã này có thể chạy trên các phiên bản MATLAB cũ hơn không?**  
A1: Mã này được thiết kế để chạy trên MATLAB R2018b hoặc các phiên bản mới hơn. Đối với các phiên bản cũ hơn, có thể có một số hàm hoặc tính năng không tương thích.

**Q2: Tôi có thể sử dụng mã này cho dữ liệu lớn hơn không?**  
A2: Có thể, nhưng bạn cần điều chỉnh các tham số và kiểm tra hiệu suất của thuật toán trên dữ liệu lớn hơn để đảm bảo rằng nó hoạt động hiệu quả.

**Q3: Mã này có thể chạy trên GNU Octave không?**  
A3: Mã có thể chạy trong GNU Octave, nhưng một số tính năng vẽ đồ thị có thể không hoạt động đúng. Nếu bạn cần vẽ đồ thị, khuyến nghị sử dụng MATLAB để đảm bảo tất cả các tính năng hoạt động chính xác.

**Q4: Làm thế nào để thay đổi số lượng cụm trong phân cụm?**  
A4: Thay đổi giá trị của biến `c` trong mã nguồn để thay đổi số lượng cụm. 

## Đóng Góp

Nếu bạn muốn đóng góp cho dự án này, vui lòng làm theo các bước sau:

1. Fork dự án này.
2. Tạo một nhánh mới cho các thay đổi của bạn.
3. Thực hiện các thay đổi và kiểm tra chúng.
4. Gửi một pull request mô tả các thay đổi và lý do bạn thực hiện chúng.

## Vấn Đề

Nếu bạn gặp bất kỳ vấn đề nào trong quá trình sử dụng hoặc có bất kỳ câu hỏi nào về mã nguồn, vui lòng kiểm tra phần [Issues](https://github.com/hungtrannam/Fuzzy-Clustering/issues) trên GitHub hoặc mở một issue mới để báo cáo vấn đề.

## Giấy Phép

Dự án này được cấp phép theo Giấy phép MIT. Xem tệp [LICENSE](LICENSE) để biết thêm chi tiết.

## Liên Hệ

Nếu bạn có bất kỳ câu hỏi hoặc đề xuất nào, vui lòng liên hệ với tôi qua email: [namhung34.info@gmail.com](mailto:namhung34.info@gmail.com).
