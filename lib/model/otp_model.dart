import 'dart:convert';

class OtpModel {
  String id;
  String name;
  String otp;
  String amount;
  String status;
  OtpModel({
    this.id,
    this.name,
    this.otp,
    this.amount,
    this.status,
  });

  OtpModel copyWith({
    String id,
    String name,
    String otp,
    String amount,
    String status,
  }) {
    return OtpModel(
      id: id ?? this.id,
      name: name ?? this.name,
      otp: otp ?? this.otp,
      amount: amount ?? this.amount,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'otp': otp,
      'amount': amount,
      'status': status,
    };
  }

  factory OtpModel.fromMap(Map<String, dynamic> map) {
    return OtpModel(
      id: map['id'],
      name: map['name'],
      otp: map['otp'],
      amount: map['amount'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OtpModel.fromJson(String source) => OtpModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OtpModel(id: $id, name: $name, otp: $otp, amount: $amount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OtpModel &&
      other.id == id &&
      other.name == name &&
      other.otp == otp &&
      other.amount == amount &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      otp.hashCode ^
      amount.hashCode ^
      status.hashCode;
  }
}
