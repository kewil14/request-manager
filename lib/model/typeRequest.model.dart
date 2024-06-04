class Identification {
  final int? id;
  final String? name;

  Identification({
    this.id,
    this.name,
  });

  factory Identification.fromJson(Map<String, dynamic> json) {
    return Identification(id: json['id'], name: json['name']);
  }
}
