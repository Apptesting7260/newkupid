class AllOcupationsModel {
  AllOcupationsModel({
     this.status,
     this.occupations,
  });
   String ?status;
   List<Occupations> ?occupations;
  
  AllOcupationsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    occupations = List.from(json['occupations']).map((e)=>Occupations.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['occupations'] = occupations!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Occupations {
  Occupations({
     this.id,
     this.name,
     this.status,
     this.createdAt,
     this.updatedAt,
  });
   int ?id;
   String? name;
   String ?status;
   String? createdAt;
   String ?updatedAt;
  
  Occupations.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}