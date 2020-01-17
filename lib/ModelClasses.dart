// To parse this JSON data, do
//
//     final work = workFromJson(jsonString);

import 'dart:convert';


//Work workFromJson(String str) => Work.fromJson(json.decode(str));

//String workToJson(Work data) => json.encode(data.toJson());

dynamic dateEncode(dynamic item) {
  if(item is DateTime) {
    return item.toIso8601String();
  }
  return item;
}

class Role {
  int id;
  String roleName;
  Role({this.id,this.roleName});
  Map<String, dynamic> toJson() =>
  {
    "id":id,
    "roleName":roleName
  };

  factory Role.fromJson(Map<String, dynamic> json) {
    return json!=null?new Role(
      id: json['id'],
      roleName: json['roleName']
    ):null;
  }
}

class User {
  int id;
  String userName;
  String password;
  String firstName;
  String lastName;
  bool isActive;
  Role role;
  int roleId;

  User({this.id,this.userName,this.password,this.firstName,this.lastName,this.isActive,this.role,this.roleId});

  Map<String, dynamic> toJson() =>
  {
    "id":id,
    "username":userName,
    "password":password,
    "firstName":firstName,
    "lastName":lastName,
    "isActive":isActive,
    "role":role!=null?role.toJson():null,
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      id: json['id'],
      userName: json['userName'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      isActive: json['isActive'],
      role: json['role']!=null?Role.fromJson(json['role']):null,
      roleId: json['role']!=null?Role.fromJson(json['role']).id:null,
    );
  }

}


class Site {
  int id;
  String siteName;
  String siteAddress;
  bool isCompleted;
  User createdUser;
  DateTime createdTime;
  User lastChangedUser;
  DateTime lastChangedTime;

  Site({this.id,this.siteName,this.siteAddress,this.isCompleted,this.createdUser,this.createdTime,this.lastChangedUser,this.lastChangedTime});

  /*String toJSON() {
    return jsonEncode(this,toEncodable: dateEncode);
  }*/

  Map<String, dynamic> toJson() =>
  {
    "id": id,
    "siteName": siteName,
    "siteAddress": siteAddress,
    "isCompleted":isCompleted,
    "createdUser":createdUser!=null?createdUser.toJson():null,
    "createdTime": createdTime!=null?createdTime.toIso8601String():null,
    "lastChangedUser":lastChangedUser!=null?lastChangedUser.toJson():null,
    "lastChangedTime":lastChangedTime!=null?lastChangedTime.toIso8601String():null
  };

  factory Site.fromJson(Map<String, dynamic> json) {
    return new Site(
        id:json['id'],
        siteName: json['siteName'],
        siteAddress: json['siteAddress'],
        isCompleted: json['isCompleted'],
        createdUser: json['createdUser']!=null?User.fromJson(json['createdUser']):null,
        createdTime: json['createdTime']!=null?DateTime.parse(json['createdTime'] as String):null,
        lastChangedUser: json['lastChangedUser']!=null?User.fromJson(json['lastChangedUser']):null,
        lastChangedTime: json['lastChangedTime']!=null?DateTime.parse(json['lastChangedTime'] as String):null,
    );
  }
}

class Menu {
  int id;
  String menuName;
  Role role;

  Menu({this.id,this.menuName,this.role});

  Map<String, dynamic> toJson() =>
  {
    "id":id,
    "menuName":menuName,
    "role":role!=null?role.toJson():null,
  };

  factory Menu.fromJson(Map<String, dynamic> json) {
    return new Menu(
      id: json['id'],
      menuName: json['menuName'],
      role: json['role']!=null?Role.fromJson(json['role']):null
    );
  }
}

class Status {
  int id;
  String status;

  Status({this.id,this.status});

  Map<String, dynamic> toJson() =>
  {
    "id":id,
    "status":status
  };

  factory Status.fromJson(Map<String, dynamic> json) {
    return new Status(
      id:json['id'],
      status: json['status']
    );
  }
}

class Work {
  int id;
  String workName;

  Work({this.id,this.workName});

  Map<String, dynamic> toJson() =>
      {
        "id":id,
        "workName":workName
      };

  factory Work.fromJson(Map<String, dynamic> json) {
    return new Work(
        id:json['id'],
        workName: json['workName']
    );
  }
}

class WorkDetails {
  int id;

  Site site;
  Work work;
  Status status;

  DateTime entryDate;
  double length;
  double width;
  double height;
  double measurement;

  double rate;
  int numberOfItems;

  bool isDeductible;
  String deductionName;
  double deductibleLength;
  double deductibleWidth;
  double deductibleHeight;
  double deductibleMeasurement;

  double totalMeasurement;
  double totalRate;
  String remarks;

  User createdUser;
  DateTime createdTime;
  User lastChangedUser;
  DateTime lastChangedTime;

  WorkDetails({
    this.id,
    this.site,
    this.work,
    this.status,
    this.entryDate,
    this.length,
    this.width,
    this.height,
    this.measurement,
    this.rate,
    this.numberOfItems,
    this.isDeductible,
    this.deductionName,
    this.deductibleLength,
    this.deductibleWidth,
    this.deductibleHeight,
    this.deductibleMeasurement,
    this.totalMeasurement,
    this.totalRate,
    this.remarks,
    this.createdUser,
    this.createdTime,
    this.lastChangedUser,
    this.lastChangedTime,
  });

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "site": site!=null?site.toJson():null,
        "work": work!=null?work.toJson():null,
        "status":status!=null?status.toJson():null,
        "entryDate": entryDate!=null?entryDate.toIso8601String():null,
        "length":length,
        "width": width,
        "height":height,
        "measurement":measurement,
        "rate":rate,
        "numberOfItems":numberOfItems,
        "isDeductible":isDeductible,
        "deductionName":deductionName,
        "deductibleLength":deductibleLength,
        "deductibleWidth":deductibleWidth,
        "deductibleHeight":deductibleHeight,
        "deductibleMeasurement":deductibleMeasurement,
        "totalMeasurement":totalMeasurement,
        "totalRate":totalRate,
        "remarks":remarks,
        "createdUser":createdUser!=null?createdUser.toJson():null,
        "createdTime": createdTime!=null?createdTime.toIso8601String():null,
        "lastChangedUser":lastChangedUser!=null?lastChangedUser.toJson():null,
        "lastChangedTime":lastChangedTime!=null?lastChangedTime.toIso8601String():null
      };

  factory WorkDetails.fromJson(Map<String, dynamic> json) {
    return new WorkDetails(
      id:json['id'],
      site:json['site']!=null?Site.fromJson(json['site']):null,
      work:json['work']!=null?Work.fromJson(json['work']):null,
      status:json['status']!=null?Status.fromJson(json['status']):null,
      entryDate:json['entryDate']!=null?DateTime.parse(json['entryDate'] as String):null,
      length:json['length'],
      width:json['width'],
      height:json['height'],
      measurement:json['measurement'],
      rate:json['rate'],
      numberOfItems:json['numberOfItems'],
      isDeductible:json['isDeductable'],
      deductionName:json['deductionName'],
      deductibleLength:json['deductibleLength'],
      deductibleWidth:json['deductibleWidth'],
      deductibleHeight:json['deductibleHeight'],
      deductibleMeasurement:json['deductibleMeasurement'],
      totalMeasurement:json['totalMeasurement'],
      totalRate:json['totalRate'],
      remarks:json['remarks'],
      createdUser: json['createdUser']!=null?User.fromJson(json['createdUser']):null,
      createdTime: json['createdTime']!=null?DateTime.parse(json['createdTime'] as String):null,
      lastChangedUser: json['lastChangedUser']!=null?User.fromJson(json['lastChangedUser']):null,
      lastChangedTime: json['lastChangedTime']!=null?DateTime.parse(json['lastChangedTime'] as String):null,
    );
  }
}

class OldWork {
  int id;
  String date;
  String serialNumber;
  String workName;
  double length;
  double width;
  double height;
  double rate;
  double totalMeasurement;
  double totalValue;
  bool isDeduct;
  double deductLength;
  double deductWidth;
  double deductHeight;
  String remarks;

  OldWork({
    this.id,
    this.date,
    this.serialNumber,
    this.workName,
    this.length,
    this.width,
    this.height,
    this.totalMeasurement,
    this.rate,
    this.totalValue,
    this.isDeduct,
    this.deductLength,
    this.deductWidth,
    this.deductHeight,
    this.remarks,
  });

  factory OldWork.fromJson(Map<String, dynamic> json) => OldWork(
    id: json["id"],
    date: json["date"],
    serialNumber: json["serialNumber"],
    workName: json["workName"],
    length: json["length"],
    width: json["width"],
    height: json["height"],
    totalMeasurement: json["totalMeasurement"],
    rate: json["rate"],
    totalValue: json["totalValue"],
    isDeduct: json["isDeduct"],
    deductLength: json["deductLength"],
    deductWidth: json["deductWidth"],
    deductHeight: json["deductHeight"],
    remarks: json["remarks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "serialNumber": serialNumber,
    "workName": workName,
    "length": length,
    "width": width,
    "height": height,
    "totalMeasurement": totalMeasurement,
    "rate": rate,
    "totalValue": totalValue,
    "isDeduct": isDeduct,
    "deductLength": deductLength,
    "deductWidth": deductWidth,
    "deductHeight": deductHeight,
    "remarks": remarks,
  };
}
