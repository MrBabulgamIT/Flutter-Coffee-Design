import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeType extends StatelessWidget {
  CoffeType(
      {required this.coffeeType,
      required this.onTap,
      required this.isSelected});
  final String coffeeType;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 25),
        child: Text(
          coffeeType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
