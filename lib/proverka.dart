import 'package:flutter/material.dart';

class ProverkaPage extends StatelessWidget {
  int ind;
  var data;
  ProverkaPage({
    Key? key,
    required this.ind,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue, body: SafeArea(child: Column()));
  }
}
