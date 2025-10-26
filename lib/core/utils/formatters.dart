import 'package:intl/intl.dart';

String formatarDistancia(double metros) {
  final formatadorKm = NumberFormat("#,##0.0", "pt_BR");

  if (metros >= 1000) {
    final km = metros / 1000;
    final textoKm = km < 10
        ? formatadorKm.format(km)
        : km.toStringAsFixed(0);
    return "$textoKm km até o local";
  } else {
    return "${metros.toStringAsFixed(0)} metros até o local";
  }
}
