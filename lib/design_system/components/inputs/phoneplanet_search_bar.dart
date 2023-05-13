import 'package:flutter/material.dart';

class PhoneplanetSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const PhoneplanetSearchBar({
    Key? key,
    this.controller,
    this.hintText = 'Pesquisar',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: hintText,
      ),
    );
  }
}
