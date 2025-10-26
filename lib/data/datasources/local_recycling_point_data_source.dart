import "dart:convert";
import "package:eco_locator/data/datasources/i_recycling_point_datasource.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:eco_locator/data/models/recycling_point_model.dart";

class LocalRecyclingPointDatasource extends IRecyclingPoingDatasource {
  @override
  Future<List<RecyclingPointModel>> getRecyclingPoints() async {
    final assetPath = dotenv.maybeGet("ASSET_PATH");

    if (assetPath == null || assetPath.isEmpty) {
      throw ArgumentError(
        "Variável de ambiente ASSET_PATH não definida no arquivo .env.",
      );
    }

    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final List<dynamic> jsonList = json.decode(jsonString);

      return jsonList
          .take(75)
          .map((item) => RecyclingPointModel.fromJson(item))
          .toList();
    } on FlutterError {
      throw Exception("Erro ao carregar o arquivo localizado em '$assetPath'.");
    } on FormatException {
      throw Exception(
        "O arquivo JSON em '$assetPath' possui formato inválido.",
      );
    } catch (e) {
      throw Exception("Erro inesperado ao carregar pontos de reciclagem: $e");
    }
  }
}
