class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? NId;
  dynamic DOB;
  String? uImage;

  //String? image;
  // bool? isEmailVerified;

  UserModel({this.name, this.email, this.phone, this.uId, this.NId, this.DOB , this.uImage
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
          uImage: json['uImage'],
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
      'uImage': uImage,
      //'bio': bio,
      //'cover': cover,
      //'image': image,
      // 'isEmailVerified': isEmailVerified
    };
  }
}
