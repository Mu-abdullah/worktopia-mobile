class CompanyModel {
  final String? id;
  final String? companyName;


  CompanyModel({
    this.id,
    this.companyName,
   
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json["id"],
        companyName: json["comapnyName"],
        
      );

  Map<String, dynamic> toJson() {
    return {
      if (id != null) "id": id,
      if (companyName != null) "comapnyName": companyName,
    };
  }
}
