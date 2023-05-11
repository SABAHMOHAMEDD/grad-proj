import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../const/const.dart';
import '../screens/chat_screen/chat_screen.dart';

class DefFloatActionButton extends StatelessWidget {
  final String serviceId;
  const DefFloatActionButton({Key? key, required this.serviceId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color(0xFFf08986),
        child: const FaIcon(FontAwesomeIcons.robot),
        onPressed: () {
          navigateTo(
              context,
              ChatScreen(
                serviceId: serviceId,
                ctx: context,
              ));
        });
  }
}
