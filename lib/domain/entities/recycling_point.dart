import "package:latlong2/latlong.dart";

class RecyclingPoint {
  final String nome;
  final List<String> acceptedMaterials;
  final double latitude;
  final double longitude;

  RecyclingPoint({
    required this.nome,
    required this.acceptedMaterials,
    required this.latitude,
    required this.longitude,
  });

  LatLng get location => LatLng(latitude, longitude);
}
