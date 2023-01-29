import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
  final T? item;
  final Widget? child;
  final DismissDirectionCallback? onDismissed;

  const DismissibleWidget({
    this.item,
    this.child,
    this.onDismissed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Dismissible(
        key: UniqueKey(),
        background: buildSwipeActionLeft(),
        secondaryBackground: buildSwipeActionRight(),
        child: child!,
        onDismissed: onDismissed,
      );

  Widget buildSwipeActionLeft() => Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.green,
        child: Icon(Icons.edit, color: Colors.white, size: 32),
      );

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: Icon(Icons.delete_forever,
            color: Color.fromARGB(255, 18, 17, 17), size: 32),
      );
}
