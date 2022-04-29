
import 'package:flutter/material.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 200.0,
      ),
      padding: const EdgeInsets.all(8.0),
      color: Colors.blue[600],
      alignment: Alignment.center,
      child: Text('Location',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white)),
      transform: Matrix4.rotationZ(0.1),
    );
  }
}
