import 'dart:convert';

class Pond {
  int? id_int;
  String? alias;
  String? location;
  String? shape;
  String? material;
  double? length;
  double? width;
  double? diameter;
  double? height;
  double? area;
  double? volume;
  String? build_at;
  String? image_link;
  bool? isActive;

  Pond({
    this.id_int,
    this.alias,
    this.location,
    this.shape,
    this.material,
    this.length,
    this.width,
    this.diameter,
    this.height,
    this.area,
    this.volume,
    this.build_at,
    this.image_link,
    this.isActive,
  });

  factory Pond.fromJson(Map<String, dynamic> json) {
    return Pond(
      id_int: json['id_int'],
      alias: json['alias'],
      location: json['location'],
      shape: json['shape'],
      material: json['material'],
      length: json['length'],
      width: json['width'],
      diameter: json['diameter'],
      height: json['height'],
      area: json['area'],
      volume: json['volume'],
      build_at: json['build_at'],
      image_link: json['image_link'],
      isActive: json['isActive'],
    );
  }
}
