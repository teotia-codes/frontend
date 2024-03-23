
class Person {
  final int id;
  final String name;
  final String phone;
  final int age;

  Person({required this.id, required this.name, required this.phone, required this.age});

  factory Person.fromJson(Map<String, dynamic> json) {
   return Person(
    id: json['id'],
    name: json['pname'],
    phone: json['pphone'],
    age: int.parse(json['pAge']), // Parse pAge as an integer
  );
  }
}