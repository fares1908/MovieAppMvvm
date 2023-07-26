import 'package:cars/core/utils/Router.dart';
import 'package:cars/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      child: Row(
        children: [
          Text('$text',
          style: Styles.textStyle20,
          ),
          Spacer(),
          Row(
            children: [
              Text('See More'),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ],
          )
        ],
      ),
    );
  }
}
