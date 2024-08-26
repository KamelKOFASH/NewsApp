import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color color;
  final double size;

  const CustomCircularProgressIndicator({
    Key? key,
    this.color = Colors.orange,
    this.size = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 8.0,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          backgroundColor: Colors.transparent, // Use transparent to keep the custom background
        ),
      ),
    );
  }
}
