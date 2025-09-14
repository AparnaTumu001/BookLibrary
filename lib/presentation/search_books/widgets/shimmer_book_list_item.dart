import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBookListItem extends StatelessWidget {
  const ShimmerBookListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          color: Colors.white,
        ),
        title: Container(
          height: 12,
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 6),
        ),
        subtitle: Container(
          height: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
