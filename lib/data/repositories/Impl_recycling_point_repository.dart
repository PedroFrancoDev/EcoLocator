import "dart:math" as math;
import "package:eco_locator/domain/entities/recycling_point.dart";
import "package:flutter/material.dart";
import "package:latlong2/latlong.dart";

import "package:eco_locator/data/datasources/i_recycling_point_datasource.dart";
import "package:eco_locator/domain/repositories/i_recycling_point_repository.dart";

class ImplRecyclingPoingRepository implements IRecyclingPointRepository {
  final IRecyclingPoingDatasource _datasource;

  ImplRecyclingPoingRepository(this._datasource);

  @override
  Future<List<RecyclingPoint>> getRecyclingPoints() async {
    try {
      return _datasource.getRecyclingPoints();
    } catch (e) {
      return [];
    }
  }

 Future<double?> getDistanceBetweenPoints(LatLng pointA, LatLng pointB) async {
    const double earthRadiusMeters = 6371000.0; // Raio médio da Terra em metros
    
    try {
      // Converte coordenadas de graus para radianos
      final double lat1Rad = _toRadians(pointA.latitude);
      final double lat2Rad = _toRadians(pointB.latitude);
      final double deltaLatRad = _toRadians(pointB.latitude - pointA.latitude);
      final double deltaLngRad = _toRadians(
        pointB.longitude - pointA.longitude,
      );

      // Etapa 1: Calcula o valor 'haversine' (parte do meio da fórmula)
      final double haversineLat =
          math.sin(deltaLatRad / 2) * math.sin(deltaLatRad / 2);
      final double haversineLng =
          math.sin(deltaLngRad / 2) * math.sin(deltaLngRad / 2);
      final double haversine =
          haversineLat + math.cos(lat1Rad) * math.cos(lat2Rad) * haversineLng;

      // Etapa 2: Calcula o ângulo central entre os dois pontos
      final double centralAngle =
          2 * math.atan2(math.sqrt(haversine), math.sqrt(1 - haversine));

      // Etapa 3: Calcula a distância final em metros
      final double distanceMeters = earthRadiusMeters * centralAngle;

      return distanceMeters;
    } catch (error, stackTrace) {
      debugPrint("Erro ao calcular distância: $error\n$stackTrace");
      return null;
    }
  }

  // Função auxiliar para converter graus em radianos
  double _toRadians(double degrees) => degrees * math.pi / 180;
}
