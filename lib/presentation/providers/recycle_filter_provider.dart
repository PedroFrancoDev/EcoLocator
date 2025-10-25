import 'package:eco_locator/core/enums/filter_status.dart';
import 'package:flutter/widgets.dart';

class RecycleFilterProvider extends ChangeNotifier {
  RecyclingType _recyclingType = RecyclingType.all;

  RecyclingType get recyclingType => _recyclingType;

  void closeFilterModal({required BuildContext context}) {
    Navigator.pop(context);
  }

  bool isFilterActive({required RecyclingType recyclingType}) {
    final isActive = recyclingType == _recyclingType;
    
    return isActive;
  }

  void changeFilter({required RecyclingType currentFilter}) {
    _recyclingType = currentFilter;

    notifyListeners();
  }
}
