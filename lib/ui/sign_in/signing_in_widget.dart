import 'package:enviro_bank/generated/l10n.dart';
import 'package:flutter/material.dart';

class SigningInWidget extends StatelessWidget {
  const SigningInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(S.of(context).signingInMessage),
          const SizedBox(
            height: 16,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
