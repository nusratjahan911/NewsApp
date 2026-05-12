import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.context,
    required this.image,
    required this.index,
    required this.name,
  });

  final BuildContext context;
  final String image;
  final int index;
  final String name;

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: Image.network(
            image,
            height: 250,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          height: 250,
          padding: EdgeInsets.only(left: 10.0),
          margin: EdgeInsets.only(top: 170.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Text(name,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
        ),
      ],
    ),
  );
}
