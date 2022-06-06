import 'package:flutter/material.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({Key? key})
      : super(
          key: key,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
        );
}
