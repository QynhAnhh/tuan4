import 'package:flutter/material.dart';
import '../models/library_model.dart';

class MainScreenBT2 extends StatefulWidget {
  const MainScreenBT2({super.key});

  @override
  State<MainScreenBT2> createState() => _MainScreenBT2State();
}

class _MainScreenBT2State extends State<MainScreenBT2> {
  // Khởi tạo dữ liệu OOP
  late Student currentStudent;
  late List<Book> libraryBooks;

  @override
  void initState() {
    super.initState();
    // Tạo sinh viên theo mẫu
    currentStudent = Student("Nguyen Van A");

    // Tạo danh sách sách
    libraryBooks = [
      Book("Sách 01"),
      Book("Sách 02"),
    ];

    // Giả lập sinh viên đã mượn sẵn các sách này
    currentStudent.borrowBook(libraryBooks[0]);
    currentStudent.borrowBook(libraryBooks[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Tiêu đề
              const Center(
                child: Text(
                  "Hệ thống\nQuản lý Thư viện",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Khối thông tin Sinh viên
              const Text(
                "Sinh viên",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        currentStudent.name,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Logic thay đổi sinh viên sau này
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3C63EA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Text("Thay đổi", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Khối Danh sách Sách
              const Text(
                "Danh sách sách",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView(
                    children: libraryBooks.map((book) => _buildBookItem(book)).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Center(
                child: SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3C63EA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Thêm",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF3C63EA),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Quản lý',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'DS Sách',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Sinh viên',
          ),
        ],
      ),
    );
  }

  // Widget hiển thị từng dòng sách
  Widget _buildBookItem(Book book) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: CheckboxListTile(
        value: book.isBorrowed,
        title: Text(book.title),
        activeColor: Colors.red.shade400,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              currentStudent.borrowBook(book);
            } else {
              currentStudent.returnBook(book);
            }
          });
        },
      ),
    );
  }
}