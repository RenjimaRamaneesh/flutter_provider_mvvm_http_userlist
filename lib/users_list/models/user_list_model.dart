import 'dart:convert';

// Function to parse JSON string into a list of UserModel
List<UserModel> usersListModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

// Function to convert a list of UserModel to JSON string
String usersListModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.id = 0,
    this.name = "",
    this.username = "",
    this.email = "",
    this.address,
    this.phone = "",
    this.website = "",
    this.company,
  });

  int id;
  String name;
  String username;
  String email;
  Address? address; // Made nullable
  String phone;
  String website;
  Company? company; // Made nullable

  // Factory constructor for creating a UserModel from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    username: json["username"] ?? "",
    email: json["email"] ?? "",
    address: json["address"] != null
        ? Address.fromJson(json["address"])
        : null, // Handle null explicitly
    phone: json["phone"] ?? "",
    website: json["website"] ?? "",
    company: json["company"] != null
        ? Company.fromJson(json["company"])
        : null, // Handle null explicitly
  );

  // Method to convert a UserModel to a JSON map
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address?.toJson(), // Use ?. for nullable field
    "phone": phone,
    "website": website,
    "company": company?.toJson(), // Use ?. for nullable field
  };
}

class Address {
  Address({
    this.street = "",
    this.suite = "",
    this.city = "",
    this.zipcode = "",
    this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo? geo; // Made nullable

  // Factory constructor for creating an Address from a JSON map
  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"] ?? "",
    suite: json["suite"] ?? "",
    city: json["city"] ?? "",
    zipcode: json["zipcode"] ?? "",
    geo: json["geo"] != null ? Geo.fromJson(json["geo"]) : null, // Handle null
  );

  // Method to convert an Address to a JSON map
  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo?.toJson(), // Use ?. for nullable field
  };
}

class Geo {
  Geo({
    this.lat = "0.0",
    this.lng = "0.0",
  });

  String lat;
  String lng;

  // Factory constructor for creating a Geo object from a JSON map
  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json["lat"] ?? "0.0",
    lng: json["lng"] ?? "0.0",
  );

  // Method to convert a Geo object to a JSON map
  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  Company({
    this.name = "",
    this.catchPhrase = "",
    this.bs = "",
  });

  String name;
  String catchPhrase;
  String bs;

  // Factory constructor for creating a Company object from a JSON map
  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"] ?? "",
    catchPhrase: json["catchPhrase"] ?? "",
    bs: json["bs"] ?? "",
  );

  // Method to convert a Company object to a JSON map
  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}


