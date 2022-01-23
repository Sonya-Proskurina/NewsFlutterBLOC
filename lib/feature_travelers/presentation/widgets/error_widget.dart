import 'package:flutter/material.dart';
import 'package:flutter_t/core/constants/strings.dart';

class ErrorListWidget extends StatelessWidget {
  const ErrorListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        ERROR_INTERNET_TEXT,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
