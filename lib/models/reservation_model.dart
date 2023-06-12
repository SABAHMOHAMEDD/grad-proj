class ReservationModel {
  dynamic bookingStart;
  dynamic bookingEnd;
  String? pId;
  String? pName;
  String? pPhone;
  dynamic pDOB;
  String? pImage;
  String? rId;
  String? dName;
  String? dId;
  String? dBio;
  String? dImg;
  String? treatment;



  ReservationModel({
    this.bookingStart,
    this.bookingEnd,
    this.pId,
    this.pName,
    this.pPhone,
    this.pDOB,
    this.pImage,
    this.rId,
    this.dName,
    this.dId,
    this.dBio,
    this.dImg,
    this.treatment,
  });

  ReservationModel.fromJson(Map<String, dynamic> json) {
    bookingStart = json['bookingStart'];
    bookingEnd = json['bookingEnd'];
    pId = json['pId'];
    pName = json['pName'];
    pDOB = json['pDOB'];
    pPhone = json['pPhone'];
    pImage = json['pImage'];
    rId = json['rId'];
    dName = json['dName'];
    dId = json['dId'];
    dBio = json['dBio'];
    dImg = json['dImg'];
    treatment = json['treatment'];
  }

  Map<String, dynamic> toMap() {
    return {
      'bookingStart': bookingStart,
      'bookingEnd': bookingEnd,
      'pId': pId,
      'pName': pName,
      'pDOB': pDOB,
      'pPhone': pPhone,
      'pImage': pImage,
      'rId': rId,
      'dName': dName,
      'dId': dId,
      'dBio': dBio,
      'dImg': dImg,
      'treatment': treatment,
    };
  }
}