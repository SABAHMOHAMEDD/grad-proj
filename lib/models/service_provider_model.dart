class ServiceProviderModel{
  String? id;
  String? logo;
  String? name;
  String? type;
  int? balance;

  ServiceProviderModel(this.id, this.logo, this.name, this.type,this.balance);

  ServiceProviderModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    logo = json['logo'];
    name = json['name'];
    type = json['type'];
    balance = json['balance'];
  }

  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      'logo' : logo,
      'name' : name,
      'balance' : balance,
    };

  }

}