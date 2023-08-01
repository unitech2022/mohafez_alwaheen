import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';


class CircleImageWidget extends StatelessWidget {
  final double height, width;
  final String image;
  const CircleImageWidget({super.key, required this.height ,required this.width ,required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
     borderRadius: BorderRadius.circular(width / 2),
      child: CachedNetworkImage(
        imageUrl: image,height: height,width: width,fit: BoxFit.cover,
    
        placeholder: (context, url) => const SizedBox(),
        errorWidget: (context, url, error) => Icon(Icons.person,size: width/1.5,color: Color.fromARGB(255, 41, 40, 40),),
      ),
    );
  }
}
