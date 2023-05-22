class ReservationModel {
  dynamic bookingStart;
  dynamic bookingEnd;
  String? pId;
  String? pName;
  String? pPhone;
  dynamic pDOB;
  String? pImage;
  String? rId;



  ReservationModel({
    this.bookingStart,
    this.bookingEnd,
    this.pId,
    this.pName,
    this.pPhone,
    this.pDOB,
    this.pImage,
    this.rId,
  });

  ReservationModel.fromJson(Map<String, dynamic> json) {
    bookingStart = json['bookingStart'];
    bookingEnd = json['bookingEnd'];
    pId = json['pId'];
    pName = json['pName'];
    pDOB = json['pDOB'];
    pImage = json['pImage'];
    rId = json['rId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'bookingStart': bookingStart,
      'bookingEnd': bookingEnd,
      'pId': pId,
      'pName': pName,
      'pDOB': pDOB,
      'pImage': pImage,
      'rId': rId,
    };
  }
}