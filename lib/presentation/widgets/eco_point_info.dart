import "package:eco_locator/core/enums/theme_status.dart";
import "package:eco_locator/core/utils/formatters.dart";
import "package:eco_locator/presentation/widgets/simple_text_button.dart";
import "package:eco_locator/presentation/providers/eco_locator_provider.dart";
import "package:flutter/material.dart";
import "package:latlong2/latlong.dart";

void showEcoPointInfo(
  BuildContext context, {
  required EcoLocatorProvider provider,
  required String nomePonto,
  required List<String> materiais,
  required LatLng location,
  required ThemeStatus themeStatus,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    builder: (context) {
      return Dialog(
        backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: themeStatus == ThemeStatus.dark
                        ? Colors.grey[400]
                        : const Color(0xFFE2E4EA),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.map_outlined, color: Colors.green, size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      nomePonto,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: themeStatus == ThemeStatus.dark
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Text(
                'Materiais aceitos',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: themeStatus == ThemeStatus.dark
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: materiais.map((material) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getMaterialIcon(material),
                          color: _getMaterialColor(materiais),
                          size: 32,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          material,
                          style: TextStyle(
                            fontSize: 14,
                            color: themeStatus == ThemeStatus.dark
                                ? Colors.white70
                                : Colors.black54,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),
              Divider(color: Colors.grey[400]),
              const SizedBox(height: 12),

              FutureBuilder<double?>(
                future: provider.calculateDistance(
                  latLong1: provider.currentLocation!,
                  latLong2: location,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return _distanceText(
                      'Distância: Calculando...',
                      themeStatus,
                      fontWeight: FontWeight.w200,
                    );
                  } else if (snapshot.hasError) {
                    return _distanceText(
                      'Distância: Erro ao calcular',
                      themeStatus,
                      fontWeight: FontWeight.w200,
                    );
                  } else if (snapshot.hasData) {
                    final metros = snapshot.data!;
                    return Center(
                      child: Text(
                        formatarDistancia(metros),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: themeStatus == ThemeStatus.dark
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                    );
                  }
                  return _distanceText('Distância: N/A', themeStatus);
                },
              ),

              const SizedBox(height: 20),

              // Botão Fechar
              SimpleTextButton(
                isEnabled: true,
                isExpanded: true,
                onPressed: () async => Navigator.pop(context),
                label: "Fechar",
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// --- Funções auxiliares ---

Text _distanceText(
  String text,
  ThemeStatus themeStatus, {
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 16,
      color: themeStatus == ThemeStatus.dark ? Colors.white70 : Colors.black54,
    ),
  );
}

IconData _getMaterialIcon(String material) {
  switch (material.toLowerCase()) {
    case 'plástico':
      return Icons.local_drink;
    case 'vidro':
      return Icons.wine_bar;
    case 'papel':
      return Icons.description;
    case 'metal':
      return Icons.build;
    case 'orgânico':
      return Icons.eco;
    default:
      return Icons.recycling;
  }
}

Color _getMaterialColor(List<String> materiais) {
  if (materiais.contains('Vidro')) return Colors.green;
  if (materiais.contains('Plástico')) return Colors.blue;
  if (materiais.contains('Metal')) return Colors.grey;
  if (materiais.contains('Papel')) return Colors.brown;
  return Colors.orange;
}
