class SeatsModel {
  late String uId;
  late String status;

  SeatsModel({
    required this.uId,
    required this.status});

  SeatsModel.fromJeson(Map<String,dynamic>json)
  {
    uId = json['uId'];
    status = json['status'];
  }
  Map<String,dynamic>toMap()
  {
    return
      {
        'uId':uId,
        'status':status,
      };
  }

}
