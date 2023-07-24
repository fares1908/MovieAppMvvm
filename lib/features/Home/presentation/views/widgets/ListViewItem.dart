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
  final double vote;
  final String descreption;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black26)),
      child: Container(
        // color: Colors.grey,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .2,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(imageUrl),
                  )),
            ),
            SizedBox(
              width: 6,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(textName),
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
                    width: 50,
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
                    style: Styles.textStyle16,
                  ),
                ],
              ),
              SizedBox(height: 13),
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: Text(
                  descreption,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
