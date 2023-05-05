class DoctorModel{
  String? uId;
  String? bio;
  String? location;
  String? name;
  String? specialty;
  String? image;
  int? price;
  int? waitingTime;
  int? rate;

  DoctorModel(
      {this.uId,
      this.bio,
      this.location,
      this.name,
      this.specialty,
      this.image,
      this.price,
      this.waitingTime,
      this.rate});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    bio = json['bio'];
    location = json['location'];
    name = json['name'];
    specialty = json['specialty'];
    waitingTime = json['waitingTime'];
    image = json['image'];
    price = json['price'];
    rate = json['rate'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'bio': bio,
      'location': location,
      'name': name,
      'specialty': specialty,
      'waitingTime': waitingTime,
      'image': image,
      'price': price,
      'rate': rate,
    };
  }



}