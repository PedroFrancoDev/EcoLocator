import 'package:eco_locator/core/theme/colors.dart';
import 'package:eco_locator/core/utils/accepted_materials_enum.dart';
import 'package:eco_locator/presentation/providers/eco_locator_provider.dart';
import 'package:eco_locator/presentation/providers/theme_provider.dart';
import 'package:eco_locator/presentation/widgets/eco_point_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatelessWidget {
  final EcoLocatorProvider provider;
  final MapController mapController;
  final LatLng center;

  const MapWidget({
    super.key,
    required this.center,
    required this.provider,
    required this.mapController,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: center,
        initialZoom: 13.0,
        onTap: (tapPosition, latlng) {},
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.ecolocator',
        ),
        MarkerLayer(
          markers: [
            if (provider.currentLocation != null)
              Marker(
                point: provider.currentLocation!,
                width: 80,
                height: 80,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.redAccent,
                  size: 40,
                ),
              ),
            ...provider.filteredRecyclingPoints.map((point) {
              return Marker(
                point: point.location,
                width: 100,
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    showEcoPointInfo(
                      context,
                      nomePonto: "Ponto Verde Central",
                      tipoMaterial: "Plástico, Vidro, Papel",
                      distanciaKm: 1.8,
                      themeStatus: themeProvider.currentThemeStatus,
                    );
                  },
                  child: Icon(
                    _getMaterialIcon(point.acceptedMaterials.first),
                    color: _getMaterialColor(point.acceptedMaterials),
                    size: 20,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ],
    );
  }

  _getMaterialIcon(String recyclingType) {
    switch (recyclingType) {
      case AcceptedMaterials.plastic:
        return FontAwesomeIcons.recycle;
      case AcceptedMaterials.glass:
        return FontAwesomeIcons.wineBottle;
      case AcceptedMaterials.paper:
        return FontAwesomeIcons.fileLines;
      case AcceptedMaterials.metal:
        return FontAwesomeIcons.meta;
      case AcceptedMaterials.electronics:
        return FontAwesomeIcons.batteryThreeQuarters;
    }
  }

  _getMaterialColor(List<String> acceptedMaterials) {
    if (acceptedMaterials.contains(AcceptedMaterials.plastic))
      return MaterialColors.plastic;
    if (acceptedMaterials.contains(AcceptedMaterials.electronics))
      return MaterialColors.batteries;
    if (acceptedMaterials.contains(AcceptedMaterials.glass))
      return MaterialColors.glass;
    if (acceptedMaterials.contains(AcceptedMaterials.metal))
      return MaterialColors.metal;
    if (acceptedMaterials.contains(AcceptedMaterials.paper))
      return MaterialColors.paper;

    return MaterialColors.defaultColor;
  }
}
