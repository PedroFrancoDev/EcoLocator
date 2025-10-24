import "package:eco_locator/presentation/widgets/simple_text_button.dart";
import "package:flutter/material.dart";

void showEcoPointInfo(
  BuildContext context, {
  required String nomePonto,
  required String tipoMaterial,
  required double distanciaKm,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
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
                    color: Color(0xFFE2E4EA),
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
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
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
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.social_distance, color: Colors.orange, size: 22),
                  const SizedBox(width: 8),
                  Text(
                    "${distanciaKm.toStringAsFixed(2)} km de distância",
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
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
