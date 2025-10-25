import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MapSkeleton extends StatelessWidget {
  const MapSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[350]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[350],
          ),
        ),

        Positioned(
          top: 70,
          left: 24,
          right: 24,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[350]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        /// Botão flutuante (bottom-right)
        Positioned(
          right: 24,
          bottom: 24,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[350]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
