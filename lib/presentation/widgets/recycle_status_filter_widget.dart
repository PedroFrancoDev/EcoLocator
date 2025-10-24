import 'package:flutter/material.dart';

class RecycleStatusFilterWidget extends StatelessWidget {
  final String status;
  final bool isActive;
  final void Function()? onTap;

  const RecycleStatusFilterWidget(
      {super.key,
      required this.status,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: isActive ? Color(0XFF2E7D32) : Color(0xFFFBFBFB),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              width: 1,
              color: Color(0xFFF3F3F3),
            ),
          ),
          child: Text(
            status,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: isActive ? Colors.white : Color(0XFF2E7D32),
            ),
          ),
        ),
      ),
    );
  }
}
