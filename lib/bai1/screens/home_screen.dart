import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UTH Todo - Trang Chủ")),
      body: const Center(
        child: Text("Chào mừng bạn đã vào ứng dụng!"),
      ),
    );
  }
}