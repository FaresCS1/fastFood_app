import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors/appColors.dart';

class IconEvent extends StatefulWidget {
  final IconData icon;
  final dynamic route;
  const IconEvent({super.key, required this.icon, this.route});

  @override
  State<IconEvent> createState() => _IconEventState();
}

class _IconEventState extends State<IconEvent> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.route == null
            ? WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pop();
              })
            : WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => widget.route));
              });
      },
      icon: Icon(
        widget.icon,
        color: AppColors.midOrangeColor,
        size: 30,
      ),
    );
  }
}
