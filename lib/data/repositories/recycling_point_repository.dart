import "dart:math" as math;
import "package:eco_locator/domain/entities/recycling_point.dart";
import "package:flutter/material.dart";
import "package:latlong2/latlong.dart";

import "package:eco_locator/data/datasources/i_recycling_point_datasource.dart";
import "package:eco_locator/domain/repositories/i_recycling_point_repository.dart";

class RecyclingPoingRepository implements IRecyclingPointRepository {
  final IRecyclingPoingDatasource _datasource;

  RecyclingPoingRepository(this._datasource);

  @override
  Future<List<RecyclingPoint>> getRecyclingPoints() async {
    try {
      return _datasource.getRecyclingPoints();
    } catch (e) {
      return [];
    }
  }

  Future<double?> getDistanceBetweenPoints(LatLng pointA, LatLng pointB) async {
    const earthRadius = 6371000.0; // Raio da Terra em metros

    try {
      debugPrint("Calculando distância entre $pointA e $pointB...");

      final lat1 = _toRadians(pointA.latitude);
      final lat2 = _toRadians(pointB.latitude);
      final deltaLat = _toRadians(pointB.latitude - pointA.latitude);
      final deltaLng = _toRadians(pointB.longitude - pointA.longitude);

      final a =
          math.pow(math.sin(deltaLat / 2), 2) +
          math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(deltaLng / 2), 2);

      final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
      final distance = earthRadius * c;

      return distance;
    } catch (e, stackTrace) {
      debugPrint("Erro ao calcular distância: $e\n$stackTrace");
      return null;
    }
  }

  double _toRadians(double degrees) => degrees * math.pi / 180;
}
