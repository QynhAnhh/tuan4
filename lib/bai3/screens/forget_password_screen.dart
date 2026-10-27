import 'package:flutter/material.dart';
import 'verify_code_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final String? returnedEmail;
  final String? returnedOtp;
  final String? returnedPass;

  const ForgetPasswordScreen({
    super.key,
    this.returnedEmail,
    this.returnedOtp,
    this.returnedPass,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController(text: returnedEmail);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Nav (Data Flow)', style: TextStyle(color: Colors.black, fontSize: 14)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Logo
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
            const Text(
              "Forget Password?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter your Email, we will send you a verification\ncode.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Your Email',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.mail_outline, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade50,
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
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifyCodeScreen(email: emailController.text),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 40),
            // Khung hiển thị dữ liệu trả về từ màn hình 4
            if (returnedEmail != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0FA),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text('email\n$returnedEmail', textAlign: TextAlign.center, style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('otp\n$returnedOtp', textAlign: TextAlign.center, style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('pass\n$returnedPass', textAlign: TextAlign.center, style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}