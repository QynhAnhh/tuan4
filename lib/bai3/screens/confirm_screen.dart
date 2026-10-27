import 'package:flutter/material.dart';
import 'forget_password_screen.dart';

class ConfirmScreen extends StatelessWidget {
  final String email;
  final String otp;
  final String pass;

  const ConfirmScreen({
    super.key,
    required this.email,
    required this.otp,
    required this.pass,
  });

  Widget _buildCustomBackButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      decoration: const BoxDecoration(
        color: Color(0xFFE6F0FA),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF4A90E2), size: 18),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  // Hàm tạo TextField chỉ đọc (Read-only) để hiển thị dữ liệu
  Widget _buildReadOnlyField(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        readOnly: true,
        controller: TextEditingController(text: text),
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _buildCustomBackButton(context),
        leadingWidth: 60,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.network(
              'https://nkclothing.sgp1.digitaloceanspaces.com/2025/07/18003827/logo-truong-dai-hoc-giao-thong-van-tai-tp-hcm-1.jpg',
              height: 80,
            ),
            const SizedBox(height: 8),
            const Text(
              'SmartTasks',
              style: TextStyle(color: Color(0xFF3C63EA), fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Text("Confirm", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "We are here to help you!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 32),

            // Hiển thị lại các dữ liệu đã nhận
            _buildReadOnlyField(Icons.person_outline, email.isEmpty ? "uth@gmail.com" : email),
            _buildReadOnlyField(Icons.verified_user_outlined, otp),
            _buildReadOnlyField(Icons.lock_outline, '*' * (pass.length > 0 ? pass.length : 8)),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Đẩy ngược toàn bộ dữ liệu về màn hình 1 và xóa lịch sử xếp chồng
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPasswordScreen(
                        returnedEmail: email,
                        returnedOtp: otp,
                        returnedPass: pass,
                      ),
                    ),
                        (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}