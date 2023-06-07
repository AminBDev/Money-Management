import 'package:flutter/material.dart';

class IsEmpyWidget extends StatelessWidget {
  const IsEmpyWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/images/no_data.png',
      height: height ,
    );
  }
}