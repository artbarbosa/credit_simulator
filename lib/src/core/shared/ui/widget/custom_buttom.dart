import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.currentSize,
      required this.label})
      : super(key: key);
  final void Function() onPressed;
  final Size currentSize;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: currentSize.width,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 20))),
            onPressed: onPressed,
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
