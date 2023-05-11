class HospitalResponse {
  Intent? intent;

  HospitalResponse({this.intent});

  HospitalResponse.fromJson(Map<String, dynamic> json) {
    intent =
    json['intent'] != null ? new Intent.fromJson(json['intent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.intent != null) {
      data['intent'] = this.intent!.toJson();
    }
    return data;
  }
}

class Intent {
  int? id;
  String? name;
  double? confidence;

  Intent({this.id, this.name, this.confidence});

  Intent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['confidence'] = this.confidence;
    return data;
  }
}
