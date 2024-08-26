import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'News',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Cloud',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
