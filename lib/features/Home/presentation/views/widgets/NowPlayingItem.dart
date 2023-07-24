import 'package:flutter/material.dart';

import '../../../../../core/utils/assetsdata.dart';

class NowPlayingItem extends StatelessWidget {
  const NowPlayingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(AssetData.test),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Text('ddd'),
            SizedBox(
              height: 22,
            ),
            Text('THE BAD GAY'),
            SizedBox(
              height: 12,
            )
          ],
        )
      ],
    );
  }
}
