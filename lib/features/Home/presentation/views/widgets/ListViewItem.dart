import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/style.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem(
      {super.key,
      required this.imageUrl,
      required this.textName,
      required this.releaseDate,
      required this.vote,
      required this.descreption});
  final String imageUrl;
  final String textName;
  final String releaseDate;
  final String vote;
  final String descreption;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black26)),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 2.5 / 4,
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            SizedBox(
              width: 6,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    child: Text(
                      textName,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle16.copyWith(fontSize: 13,fontWeight:FontWeight.bold) ,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.redAccent,
                    ),
                    width: 100,
                    height: 20,
                    child: Center(
                      child: Text(
                        releaseDate,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    FontAwesomeIcons.solidStar,
                    size: 14,
                    color: Color(0xffFFDD4F),
                  ),
                  SizedBox(
                    width: 6.3,
                  ),
                  Text(
                    '$vote',
                    style: Styles.textStyle14,
                  ),
                ],
              ),
              SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Text(
                    descreption,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
