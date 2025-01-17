import 'package:flutter/material.dart';

import '../const.dart';

class CienmaSeat extends StatelessWidget {
  final bool isSelected;
  final bool isReserved;
  final Function() onTap;

  const CienmaSeat({
    Key? key,
    required this.isSelected,
    required this.isReserved,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
        width: MediaQuery.of(context).size.width / 15,
        height: MediaQuery.of(context).size.width / 15,
        decoration: BoxDecoration(
          color: isSelected
              ? kPimaryColor
              : isReserved
                  ? Colors.white
                  : null,
          border: !isSelected && !isReserved
              ? Border.all(color: Colors.white, width: 1.0)
              : null,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
