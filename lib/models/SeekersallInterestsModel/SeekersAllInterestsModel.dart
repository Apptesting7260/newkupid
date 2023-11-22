class SeekersAllInterestsModel {
  SeekersAllInterestsModel({
     this.status,
     this.interests,
  });
    String ?status;
    List<Interests>? interests;

  SeekersAllInterestsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    interests = List.from(json['interests']).map((e)=>Interests.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['interests'] = interests!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Interests {
  Interests({
     this.id,
     this.title,
     this.selectedIcon,
     this.unselectedIcon,
     this.status,
     this.createdAt,
     this.updatedAt,
     this.selectedIconPath,
     this.unselectedIconPath,
  });
    int ?id;
    String ?title;
    String ?selectedIcon;
    String ?unselectedIcon;
    int ?status;
    String ?createdAt;
    String? updatedAt;
    bool isselected=false;
    String ?selectedIconPath;
    String ?unselectedIconPath;

  Interests.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    selectedIcon = json['selected_icon'];
    unselectedIcon = json['unselected_icon'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    selectedIconPath = json['selected_icon_path'];
    unselectedIconPath = json['unselected_icon_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['selected_icon'] = selectedIcon;
    _data['unselected_icon'] = unselectedIcon;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['selected_icon_path'] = selectedIconPath;
    _data['unselected_icon_path'] = unselectedIconPath;
    return _data;
  }
}