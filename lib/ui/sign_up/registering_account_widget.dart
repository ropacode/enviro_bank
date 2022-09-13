import 'package:enviro_bank/generated/l10n.dart';
import 'package:flutter/material.dart';

class RegisteringAccountWidget extends StatelessWidget {
  const RegisteringAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(S.of(context).registeringAccountMessage),
          const SizedBox(height: 16,),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
