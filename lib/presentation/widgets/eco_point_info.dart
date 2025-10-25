import "package:eco_locator/core/enums/theme_status.dart";
import "package:eco_locator/presentation/widgets/simple_text_button.dart";
import "package:flutter/material.dart";

void showEcoPointInfo(
  BuildContext context, {
  required String nomePonto,
  required String tipoMaterial,
  required double distanciaKm,
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
                        : Color(0xFFE2E4EA),
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
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.straight, color: Colors.blue, size: 22),
                  const SizedBox(width: 8),
                  Text(
                    tipoMaterial,
                    style: TextStyle(
                      fontSize: 16,
                      color: themeStatus == ThemeStatus.dark
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.social_distance,
                    color: Colors.orange,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${distanciaKm.toStringAsFixed(2)} km de distância",
                    style: TextStyle(
                      fontSize: 16,
                      color: themeStatus == ThemeStatus.dark
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
