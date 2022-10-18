import 'package:flutter/material.dart';
import 'package:movies/partials/form/text_input.dart';

import '../../styles/constants.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInput(
        const Icon(
          Icons.password,
          color: kMainTextColor,
        ),
        'Votre mot de passe',
        '',
        TextInputType.visiblePassword, (value) {
      if (value == null || value.isEmpty) {
        return 'Le mot de passe doit être renseigné.';
      } else if (value.length < 9) {
        return 'Le mot de passe doit contenir au moins 9 caractères.';
      }
    }, true);
  }
}