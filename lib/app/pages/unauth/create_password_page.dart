import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneplanet/app/shared/blocs/register_bloc/bloc.dart';
import 'package:phoneplanet/app/shared/utils/phoneplanet_validators.dart';
import 'package:phoneplanet/design_system/components/buttons/phoneplanet_button.dart';
import 'package:phoneplanet/design_system/components/phoneplanet_title_header.dart';
import 'package:phoneplanet/design_system/styles/phoneplanet_text_styles.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PhoneplanetTitleHeader(
              title: 'Cadastro',
              label: 'Crie uma senha de acesso ao App',
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _passwordController,
                      validator: PhoneplanetValidators.noNullableValidator,
                      decoration: const InputDecoration(
                        label: Text('Senha'),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) {
                        String? valid;
                        if (value != _passwordController.text)
                          valid = 'As senhas devem ser iguais';
                        return valid ??
                            PhoneplanetValidators.noNullableValidator(value);
                      },
                      decoration: const InputDecoration(
                        label: Text('Confirme a senha'),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: PhoneplanetButton.secondary(
                            onTap: () {
                              if (!_formKey.currentState!.validate()) return;
                              context.read<RegisterBloc>().add(
                                    SavePassword(
                                      password: _passwordController.text,
                                    ),
                                  );
                            },
                            child: Text(
                              'Continuar',
                              style: PhoneplanetTextStyles.label.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
