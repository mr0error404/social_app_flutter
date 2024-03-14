import 'package:flutter/material.dart';
import 'package:social_app/shared/components/components.dart';

class NewPostSceeen extends StatelessWidget {
  const NewPostSceeen({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultAppBar(
      context,
      title: "Add Post",
    );
  }
}
