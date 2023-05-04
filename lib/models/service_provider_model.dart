class ServiceProviderModel{
  String? id;
  String? logo;
  String? name;
  String? type;

  ServiceProviderModel(this.id, this.logo, this.name, this.type);

  ServiceProviderModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    logo = json['logo'];
    name = json['name'];
    type = json['type'];
  }

  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      'logo' : logo,
      'name' : name,
      'type' : type,
    };

  }

}