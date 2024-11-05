import 'dart:convert';

class GuestUser {
    int success;
    String message;
    Customerdata customerdata;
    String guestId;

    GuestUser({
        required this.success,
        required this.message,
        required this.customerdata,
        required this.guestId,
    });

    factory GuestUser.fromRawJson(String str) => GuestUser.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GuestUser.fromJson(Map<String, dynamic> json) => GuestUser(
        success: json["success"],
        message: json["message"],
        customerdata: Customerdata.fromJson(json["customerdata"]),
        guestId: json["guest_id"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "customerdata": customerdata.toJson(),
        "guest_id": guestId,
    };
}

class Customerdata {
    String id;
    String name;
    String email;
    String mobile;
    int status;
    String token;

    Customerdata({
        required this.id,
        required this.name,
        required this.email,
        required this.mobile,
        required this.status,
        required this.token,
    });

    factory Customerdata.fromRawJson(String str) => Customerdata.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Customerdata.fromJson(Map<String, dynamic> json) => Customerdata(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        status: json["status"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "status": status,
        "token": token,
    };
}
