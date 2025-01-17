import 'package:flutter/material.dart';

import '../const.dart';

class ShowTime extends StatelessWidget {
  final String time;
  final int price;
  final bool isActive;
  final Function() onTap;

  const ShowTime({
    Key? key,
    required this.time,
    required this.price,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: isActive ? kPimaryColor : Colors.white12),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            Text(
              time,
              style: TextStyle(
                  color: isActive ? kPimaryColor : Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Text('From \$${price}',
                style: const TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );
  }
}
