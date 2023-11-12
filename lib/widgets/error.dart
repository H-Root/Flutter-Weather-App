import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({
    super.key,
    required this.errorMsg,
    required this.handlePress,
    required this.buttonContent,
  });

  final String errorMsg;
  final String buttonContent;
  final void Function() handlePress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/sad_cloud.svg",
            semanticsLabel: "This is an image of a sad cloud you evil person",
            width: 200,
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              errorMsg,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: handlePress,
            child: Text(
              buttonContent,
              style: const TextStyle(
                color: Color.fromARGB(
                  255,
                  128,
                  113,
                  113,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
