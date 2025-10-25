import 'package:eco_locator/core/enums/filter_status.dart';
import 'package:eco_locator/core/enums/theme_status.dart';
import 'package:eco_locator/presentation/providers/recycle_filter_provider.dart';
import 'package:eco_locator/presentation/providers/theme_provider.dart';
import 'package:eco_locator/presentation/widgets/recycle_status_filter_widget.dart';
import 'package:eco_locator/presentation/widgets/simple_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBottomSheetContent extends StatelessWidget {
  final ThemeProvider themeProvider;
  
  FilterBottomSheetContent({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    RecycleFilterProvider recycleFilterProvider = context
        .watch<RecycleFilterProvider>();
        
    return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).bottomSheetTheme.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 40, top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 60,
                          height: 5,
                          decoration: BoxDecoration(
                            color:  themeProvider.currentThemeStatus ==
                                    ThemeStatus.dark
                                ? Colors.grey[400] : Color(0xFFE2E4EA),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      SizedBox(height: 19),
                      Center(
                        child: Text(
                          "Filtrar Reciclagem",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                themeProvider.currentThemeStatus ==
                                    ThemeStatus.dark
                                ? Colors.white
                                : Color(0xFF191D31),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        height: 45,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(width: 20),
                            RecycleStatusFilterWidget(
                              status: "Todos",
                              isActive: recycleFilterProvider.isFilterActive(
                                recyclingType: RecyclingType.all,
                              ),
                              onTap: () =>
                                  recycleFilterProvider.changeFilter(currentFilter: RecyclingType.all),
                            ),
                            SizedBox(height: 12),
                            RecycleStatusFilterWidget(
                              status: "Vidro",
                              isActive: recycleFilterProvider.isFilterActive(
                                recyclingType: RecyclingType.glass,
                              ),
                              onTap: () => recycleFilterProvider.changeFilter(
                                currentFilter: RecyclingType.glass,
                              ),
                            ),
                            SizedBox(height: 12),
                            RecycleStatusFilterWidget(
                              status: "Plástico",
                              isActive: recycleFilterProvider.isFilterActive(
                                recyclingType: RecyclingType.plastic,
                              ),
                              onTap: () => recycleFilterProvider.changeFilter(
                                currentFilter: RecyclingType.plastic,
                              ),
                            ),
                            RecycleStatusFilterWidget(
                              status: "Papel",
                              isActive: recycleFilterProvider.isFilterActive(
                                recyclingType: RecyclingType.paper,
                              ),
                              onTap: () => recycleFilterProvider.changeFilter(
                                currentFilter: RecyclingType.paper,
                              ),
                            ),
                            RecycleStatusFilterWidget(
                              status: "Metal",
                              isActive: recycleFilterProvider.isFilterActive(
                                recyclingType: RecyclingType.metal,
                              ),
                              onTap: () => recycleFilterProvider.changeFilter(
                                currentFilter: RecyclingType.metal,
                              ),
                            ),
                            RecycleStatusFilterWidget(
                              status: "Pilhas e baterias",
                              isActive: recycleFilterProvider.isFilterActive(
                                recyclingType: RecyclingType.batteries,
                              ),
                              onTap: () => recycleFilterProvider.changeFilter(
                                currentFilter: RecyclingType.batteries,
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                      SizedBox(height: 42),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SimpleTextButton(
                          isEnabled: true,
                          isExpanded: true,
                          onPressed: () async =>
                              recycleFilterProvider.closeFilterModal(context: context),
                          label: "Aplicar filtro",
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}