// To parse this JSON data, do
//
//     final otPresponse = otPresponseFromJson(jsonString);

import 'dart:convert';

OtPresponse otPresponseFromJson(String str) => OtPresponse.fromJson(json.decode(str));

String otPresponseToJson(OtPresponse data) => json.encode(data.toJson());

class OtPresponse {
    OtPresponse({
         this.status,
         this.response,
         this.requestId,
    });

    bool? status;
    String? response;
    String? requestId;

    factory OtPresponse.fromJson(Map<String, dynamic> json) => OtPresponse(
        status: json["status"],
        response: json["response"],
        requestId: json["request_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
        "request_id": requestId,
    };
}
