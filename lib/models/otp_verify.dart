// To parse this JSON data, do
//
//     final otpVerify = otpVerifyFromJson(jsonString);

import 'dart:convert';

OtpVerify otpVerifyFromJson(String str) => OtpVerify.fromJson(json.decode(str));

String otpVerifyToJson(OtpVerify data) => json.encode(data.toJson());

class OtpVerify {
    OtpVerify({
         this.status,
         this.profileExists,
         this.jwt,
    });

    bool?  status;
    bool ? profileExists;
    String?  jwt;

    factory OtpVerify.fromJson(Map<String, dynamic> json) => OtpVerify(
        status: json["status"],
        profileExists: json["profile_exists"],
        jwt: json["jwt"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "profile_exists": profileExists,
        "jwt": jwt,
    };
}
