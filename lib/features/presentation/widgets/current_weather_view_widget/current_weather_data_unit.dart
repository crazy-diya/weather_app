
import 'package:flutter/material.dart';

class CurrentWeatherDataUnit extends StatelessWidget {
  const CurrentWeatherDataUnit({
    Key? key,
    required this.height, required this.name, required this.value,required this.image
  }) : super(key: key);

  final double height;
  final String name;
  final String value;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: (height * 0.02),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image,height: 50,width: 50,),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(name,style: TextStyle(color: Colors.white)),
              const SizedBox(
                height: 8,
              ),
              Text(value,style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}

