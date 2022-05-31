import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onPressed;

  CategoryCard(
      {required this.image, required this.name, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.blueGrey,
                ),
              ]),
          padding: const EdgeInsets.all(8.0),
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Image.asset(image),
                flex: 75,
              ),
              Expanded(
                  flex: 25,
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
