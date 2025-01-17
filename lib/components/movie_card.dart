import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageLink;
  final String title;
  final Function callBack;
  final bool active;

  const MovieCard({
    Key? key,
    required this.title,
    required this.imageLink,
    required this.callBack,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            onTap: callBack as void Function()?,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: SizedBox(
                width: active
                    ? MediaQuery.of(context).size.width / 3
                    : MediaQuery.of(context).size.width / 4,
                child: AspectRatio(
                  aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                  child: Image.network(
                    imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (active) // Show title only if active
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
