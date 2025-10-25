import "package:eco_locator/domain/entities/recycling_point.dart";

class RecyclingPointModel extends RecyclingPoint {
  RecyclingPointModel({
    required String nome,
    required List<String> acceptedMaterials,
    required double latitude,
    required double longitude,
  }) : super(
          nome: nome,
          acceptedMaterials: acceptedMaterials,
          latitude: latitude,
          longitude: longitude,
        );

  factory RecyclingPointModel.fromJson(Map<String, dynamic> json) {
    return RecyclingPointModel(
      nome: json["name"],
      acceptedMaterials:
          (json["materials"] as List<dynamic>).map((e) => e as String).toList(),
      latitude: json["latitude"],
      longitude: json["longitude"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "materials": acceptedMaterials,
      "latitude": latitude,
      "longitude": longitude
    };
  }

  factory RecyclingPointModel.fromEntity(RecyclingPoint entity) {
    return RecyclingPointModel(
      nome: entity.nome,
      acceptedMaterials: entity.acceptedMaterials,
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }

  @override
  String toString() {
    return "RecyclingPointModel(nome: $nome, type: $acceptedMaterials, latitude: $latitude, longitude: $longitude)";
  }
}
