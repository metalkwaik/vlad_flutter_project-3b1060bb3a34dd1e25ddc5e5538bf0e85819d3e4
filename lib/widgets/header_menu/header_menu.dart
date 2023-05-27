import 'package:flutter/material.dart';

class HeaderMenu extends StatelessWidget {
  final Function()? fun;
  final bool select;
  final Widget child;
  const HeaderMenu(
      {super.key,
      required this.fun,
      required this.select,
      required this.child});

  @override
  Widget build(BuildContext context) {
    BorderSide border(select) =>
        BorderSide(color: Colors.grey.withOpacity(select ? 0 : 1));
    return Expanded(
      child: InkWell(
        onTap: fun,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          //padding: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            border: Border(
              left: border(select),
              top: border(select),
              right: border(select),
              bottom: border(!select),
            ),
            color: Colors.black12.withOpacity(select ? 0.2 : 0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
