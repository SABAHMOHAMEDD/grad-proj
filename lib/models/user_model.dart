class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? NId;
  DateTime? DOB;

  //String? image;
  // bool? isEmailVerified;

  UserModel({this.name, this.email, this.phone, this.uId, this.NId, this.DOB
      //this.bio,
      //this.cover,
      // this.image,
      //  this.isEmailVerified
      });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          email: json['email'],
          phone: json['phone'],
          uId: json['uId'],
          NId: json['NId'],
          DOB: json['DOB'],
          //bio: json['bio'],
          //cover: json['cover'],
          //image: json['image'],
          // isEmailVerified: json['isEmailVerified']
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'NId': NId,
      'DOB': DOB,
      //'bio': bio,
      //'cover': cover,
      //'image': image,
      // 'isEmailVerified': isEmailVerified
    };
  }
}
