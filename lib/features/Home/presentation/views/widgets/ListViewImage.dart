import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListViewItemImage extends StatelessWidget {
  const ListViewItemImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.5 / 4,
          child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              // errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, progress) => const Center(child: CircularProgressIndicator())
          )
      ),
    );
  }
}