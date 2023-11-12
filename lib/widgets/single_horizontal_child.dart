import 'package:flutter/material.dart';

class HorizontalChild extends StatelessWidget {
  const HorizontalChild({super.key, required this.data, required this.icon});

  final String data;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
