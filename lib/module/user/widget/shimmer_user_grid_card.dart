import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserGridCard extends StatelessWidget {
  const ShimmerUserGridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey[400]!,
          period: const Duration(seconds: 1),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 24,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Container(
                  color: Colors.grey,
                  width: 300,
                  height: 14,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  color: Colors.grey,
                  width: 300,
                  height: 14,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
