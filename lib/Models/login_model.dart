class TicketUserModel
{
  late String name;
  late String email;
  late String phone;
  late String chName;
  late String uId;



  TicketUserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.chName,
    required this.uId,

  });

  TicketUserModel.fromJson(Map<String,dynamic>json)
  {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    chName = json['chName'];
    uId = json['uId'];

  }

  Map<String,dynamic>toMap()
  {
    return
      {
        'name':name,
        'email':email,
        'phone':phone,
        'chName':chName,
        'uId':uId,

      };
  }
}