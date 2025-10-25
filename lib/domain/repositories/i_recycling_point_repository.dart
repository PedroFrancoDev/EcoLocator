import "package:latlong2/latlong.dart";
import "package:eco_locator/domain/entities/recycling_point.dart";

abstract class IRecyclingPointRepository {
  Future<List<RecyclingPoint>> getRecyclingPoints();
  Future<double?> calculateDistance(LatLng lat, LatLng long);
}