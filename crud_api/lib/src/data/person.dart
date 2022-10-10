class Person {
  final String id;
  final String firstName;
  final String lastName;
  final String message;

  const Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.message,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      message: json['message'],
    );
  }
}
