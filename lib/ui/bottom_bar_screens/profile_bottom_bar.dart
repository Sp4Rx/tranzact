import 'package:flutter/material.dart';

class ProfileBottomBar extends StatelessWidget {
  final String? email;
  final String? image;

  const ProfileBottomBar({Key? key, this.email, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: image != null ? NetworkImage(image!) : null,
          child:
              image == null ? const Icon(Icons.person_outline, size: 48) : null,
        ),
        const SizedBox(height: 4),
        Text(email ?? '', style: const TextStyle(fontSize: 24)),
      ],
    );
  }
}
