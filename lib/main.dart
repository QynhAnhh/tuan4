import 'package:flutter/material.dart';
import 'bai1/screens/splash_screen.dart';
import 'bai2/screens/main_screen_bt2.dart';
import 'bai3/screens/forget_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tổng hợp Bài Tập',
      theme: ThemeData(
        primaryColor: const Color(0xFF3C63EA),
        fontFamily: 'Roboto',
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Bài tập'),
        backgroundColor: const Color(0xFF3C63EA),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Nút Bài tập 1
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SplashScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3C63EA),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Mở Bài tập 01: UTH Todo', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),

              // Nút Bài tập 2
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainScreenBT2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Mở Bài tập 02: Quản lý Thư viện', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),

              // Nút Bài tập 3
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Mở Bài tập 03: Data Flow', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}