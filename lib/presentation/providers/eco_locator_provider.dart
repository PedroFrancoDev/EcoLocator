import "package:eco_locator/core/enums/filter_status.dart";
import "package:eco_locator/domain/entities/recycling_point.dart";
import "package:eco_locator/domain/usecases/calculate_distance.dart";
import "package:eco_locator/domain/usecases/get_recycling_points.dart";
import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";
import "package:latlong2/latlong.dart";

class EcoLocatorProvider extends ChangeNotifier {
  final GetRecyclingPointsUseCase getAllRecyclingPoints;
  final CalculateDistanceUseCase calculateDistance;

  EcoLocatorProvider({
    required this.getAllRecyclingPoints,
    required this.calculateDistance,
  });

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;

  List<RecyclingPoint> _allRecyclingPoints = [];
  List<RecyclingPoint> _filteredRecyclingPoints = [];
  List<RecyclingPoint> get filteredRecyclingPoints => _filteredRecyclingPoints;

  RecyclingType _recyclingType = RecyclingType.all;
  RecyclingType get recyclingType => _recyclingType;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> initializeApp() async {
    _setLoading(true);
    await _getCurrentLocation();
    await _loadRecyclingPoints();
    _setLoading(false);
  }

  Future<void> _getCurrentLocation() async {
    _setErrorMessage(null);
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _setErrorMessage("O serviço de localização está desativado.");
      return Future.error("Location services are disabled.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _setErrorMessage("Permissão de localização negada.");
        return Future.error("Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _setErrorMessage(
        "Permissão de localização permanentemente negada. Por favor, ative nas configurações do app.",
      );
      return Future.error(
        "Location permissions are permanently denied, we cannot request permissions.",
      );
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _currentLocation = LatLng(position.latitude, position.longitude);
    } catch (e) {
      _setErrorMessage("Falha ao obter localização: ${e.toString()}");
    }
    notifyListeners();
  }

  Future<void> _loadRecyclingPoints() async {
    _setErrorMessage(null);
    try {
      _allRecyclingPoints = await getAllRecyclingPoints();
      changeFilter(currentFilter: RecyclingType.all);
    } catch (e) {
      _setErrorMessage(
        "Falha ao carregar pontos de reciclagem: ${e.toString()}",
      );
    }
    notifyListeners();
  }

  void closeFilterModal({required BuildContext context}) {
    Navigator.pop(context);
  }

  bool isFilterActive({required RecyclingType recyclingType}) {
    final isActive = recyclingType == _recyclingType;

    return isActive;
  }

  void changeFilter({required RecyclingType currentFilter}) {
    _recyclingType = currentFilter;

    if (_recyclingType == "Todos") {
      _filteredRecyclingPoints = List.from(_allRecyclingPoints);
    } else {
      _filteredRecyclingPoints = _allRecyclingPoints
          .where((point) => point.acceptedMaterials.contains(_recyclingType))
          .toList();
    }

    notifyListeners();
  }

  Future<double?> getDistanceToPoint(RecyclingPoint point) async {
    if (_currentLocation == null) return 0.0;
    try {
      return calculateDistance(
        latLong1: _currentLocation!,
        latLong2: LatLng(point.latitude, point.longitude),
      );
    } catch (e) {
      debugPrint("Error calculating distance: $e");
      return 0.0;
    }
  }
}
