import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(
          Icons.dashboard_rounded,
          color: Colors.blue,
          )),

           IconButton(onPressed: () {}, icon: const Icon(
          Icons.search_rounded,
          ))
      ],
    );
  }
}