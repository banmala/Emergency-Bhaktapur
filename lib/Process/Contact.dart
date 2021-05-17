class Contact {
  int id;
  String title;
  String contact;


  Contact({this.id, this.title, this.contact});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] as int,
      title: json['title'] as String,
      contact: json['contact'] as String,
    );
  }
}
