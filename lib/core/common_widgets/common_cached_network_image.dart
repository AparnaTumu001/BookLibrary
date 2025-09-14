import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget thumbNail(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    placeholder: (context, url) => Container(
      width: 100,
      height: 100,
      color: Colors.grey.shade300,
      child: Center(child: CircularProgressIndicator()),
    ),
    errorWidget: (context, url, error) => Container(
      width: 100,
      height: 100,
      color: Colors.grey.shade300,
      child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
    ),
    width: 100,
    height: 100,
    fit: BoxFit.fill,
  );
}
