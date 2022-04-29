
import 'package:flutter/material.dart';

class Favorite  extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 200.0,
      ),
      padding: const EdgeInsets.all(8.0),
      color: Colors.blue[600],
      alignment: Alignment.center,
      child: Text('Favorite',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white)),
      transform: Matrix4.rotationZ(0.1),
    );
  }
}
