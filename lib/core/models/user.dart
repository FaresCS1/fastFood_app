class Users {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map address;
  final String phone;
  final String website;
  final Map company;

  Users(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory Users.fromJson(Map<String, dynamic> map) {
    return Users(
        id: map["id"],
        name: map["name"],
        username: map["username"],
        email: map["email"],
        address: Map.from(map["address"]),
        phone: map["phone"],
        website: map["website"],
        company: Map.from(map["company"]));
  }
}
