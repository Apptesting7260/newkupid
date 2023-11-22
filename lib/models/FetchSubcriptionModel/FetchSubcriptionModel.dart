class FetchsubcriptionplanModel {
  FetchsubcriptionplanModel({
     this.status,
     this.SubscriptionDat,
  });
   String ?status;
   List<SubscriptionData>? SubscriptionDat;
  
  FetchsubcriptionplanModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    SubscriptionDat = List.from(json['SubscriptionData']).map((e)=>SubscriptionData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['SubscriptionData'] = SubscriptionDat!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SubscriptionData {
  SubscriptionData({
     this.id,
     this.makerId,
     this.amount,
     this.interval,
     this.intervalCount,
     this.priceid,
     this.subscriptionType,
     this.matches,
     this.deletedAt,
     this.createdAt,
     this.updatedAt,
  });
   int ?id;
   int ?makerId;
   int ?amount;
   String? interval;
   int? intervalCount;
   String ?priceid;
   String ?subscriptionType;
   int ? matches;
   String? deletedAt;
   String? createdAt;
   String ?updatedAt;
   bool switchValue = true;
  
  SubscriptionData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    makerId = json['maker_id'];
    amount = json['amount'];
    interval = json['interval'];
    intervalCount = json['interval_count'];
    priceid = json['priceid'];
    subscriptionType = json['subscription_type'];
    matches = json['matches'];
    deletedAt = json['deletedAt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['maker_id'] = makerId;
    _data['amount'] = amount;
    _data['interval'] = interval;
    _data['interval_count'] = intervalCount;
    _data['priceid'] = priceid;
    _data['subscription_type'] = subscriptionType;
    _data['matches'] = matches;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}