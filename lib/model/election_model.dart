import 'dart:convert';

class ElectionModel {
  final String id;
  final String nameFood;
  final String detail;
  final String image;
  ElectionModel({
     this.id,
     this.nameFood,
     this.detail,
     this.image,
  });

  ElectionModel copyWith({
    String id,
    String nameFood,
    String detail,
    String image,
  }) {
    return ElectionModel(
      id: id ?? this.id,
      nameFood: nameFood ?? this.nameFood,
      detail: detail ?? this.detail,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameFood': nameFood,
      'detail': detail,
      'image': image,
    };
  }

  factory ElectionModel.fromMap(Map<String, dynamic> map) {
    return ElectionModel(
      id: map['id'],
      nameFood: map['nameFood'],
      detail: map['detail'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ElectionModel.fromJson(String source) => ElectionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ElectionModel(id: $id, nameFood: $nameFood, detail: $detail, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ElectionModel &&
      other.id == id &&
      other.nameFood == nameFood &&
      other.detail == detail &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nameFood.hashCode ^
      detail.hashCode ^
      image.hashCode;
  }
}
