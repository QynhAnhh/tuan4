// 1. Tính Trừu tượng (Abstraction): Định nghĩa interface/lớp trừu tượng gốc
abstract class LibraryEntity {
  String getEntityInfo();
}

// 2. Tính Đóng gói (Encapsulation): Che giấu thuộc tính _name bằng private, truy cập qua getter/setter
class Person implements LibraryEntity {
  String _name;

  Person(this._name);

  String get name => _name;
  set name(String value) => _name = value;

  @override
  String getEntityInfo() {
    return "Người: $_name";
  }
}

// 3. Tính Kế thừa (Inheritance): Student kế thừa từ Person
class Student extends Person {
  List<Book> borrowedBooks = [];

  Student(String name) : super(name);

  void borrowBook(Book book) {
    if (!borrowedBooks.contains(book)) {
      borrowedBooks.add(book);
      book.isBorrowed = true;
    }
  }

  void returnBook(Book book) {
    borrowedBooks.remove(book);
    book.isBorrowed = false;
  }

  // 4. Tính Đa hình (Polymorphism): Ghi đè (override) phương thức của lớp cha
  @override
  String getEntityInfo() {
    return "Sinh viên: $name đang mượn ${borrowedBooks.length} quyển sách.";
  }
}

class Book implements LibraryEntity {
  // Đóng gói thuộc tính tiêu đề
  final String _title;
  bool isBorrowed;

  Book(this._title, {this.isBorrowed = false});

  String get title => _title;

  @override
  String getEntityInfo() {
    return "Sách: $_title - Trạng thái: ${isBorrowed ? 'Đã mượn' : 'Còn sẵn'}";
  }
}