class CountryModel {
  CountryModel({
     this.status,
     this.countries,
  });
   String? status;
   List<Countries>? countries;

  CountryModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    countries = List.from(json['countries']).map((e)=>Countries.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['countries'] = countries!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Countries {
  Countries({
    required this.id,
    required this.code,
    required this.name,
    required this.nameOfficial,
    required this.latitude,
    required this.longitude,
    required this.flagPath,
  });
  late final int id;
  late final String code;
  late final String name;
  late final String nameOfficial;
  late final String latitude;
  late final String longitude;
  late final String flagPath;

  Countries.fromJson(Map<String, dynamic> json){
    id = json['id'];
    code = json['code'];
    name = json['name'];
    nameOfficial = json['name_official'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    flagPath = json['flag_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['name'] = name;
    _data['name_official'] = nameOfficial;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['flag_path'] = flagPath;
    return _data;
  }
}