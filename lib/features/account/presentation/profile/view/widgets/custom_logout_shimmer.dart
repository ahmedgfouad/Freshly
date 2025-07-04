import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LogoutShimmer extends StatelessWidget {
  const LogoutShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFFFE0C0),
        highlightColor: const Color(0xFFFF5E00),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.logout, color: const Color(0xFF6A3A00), size: 28),
            const SizedBox(width: 8),
            Text(
              'Logging out...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF6A3A00),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
