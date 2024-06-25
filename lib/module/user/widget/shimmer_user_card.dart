import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserCard extends StatelessWidget {
  const ShimmerUserCard({super.key});

  @override

  /// Builds a shimmer user card widget.
  ///
  /// This widget displays a shimmer effect with a user card layout. It consists of a container with rounded corners and a border,
  /// containing a row with several child widgets. The row includes a circle avatar, a column with two containers displaying shimmer effect,
  /// and an icon button. The shimmer effect is achieved using the `Shimmer.fromColors` widget from the shimmer package.
  ///
  /// The `BuildContext` parameter is used to provide access to the build context of the widget tree.
  ///
  /// Returns a `Widget` that represents the shimmer user card.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// ShimmerUserCard(
  ///   buildContext: context,
  /// )
  /// ```

  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[400]!,
      period: const Duration(seconds: 1),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 24,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
