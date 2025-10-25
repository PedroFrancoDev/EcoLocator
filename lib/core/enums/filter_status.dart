enum RecyclingType {
  all, // Todos
  glass, // Vidro
  plastic, // Plástico
  paper, // Papel
  metal, // Metal
  electronics, // Eletrônico
}

extension RecyclingTypeExtension on RecyclingType {
  String get label {
    switch (this) {
      case RecyclingType.all:
        return "Todos";
      case RecyclingType.plastic:
        return "Plástico";
      case RecyclingType.glass:
        return "Vidro";
      case RecyclingType.metal:
        return "Metal";
      case RecyclingType.paper:
        return "Papel";
      case RecyclingType.electronics:
        return "Eletrônicos";
    }
  }
}
