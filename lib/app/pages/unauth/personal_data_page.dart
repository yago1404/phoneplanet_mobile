import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:phoneplanet/app/shared/utils/phoneplanet_validators.dart';
import 'package:phoneplanet/design_system/components/buttons/phoneplanet_button.dart';
import 'package:phoneplanet/design_system/components/phoneplanet_title_header.dart';
import 'package:phoneplanet/design_system/styles/phoneplanet_text_styles.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final MaskedTextController _birthdayController = MaskedTextController(
    mask: '00/00/0000',
  );

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
              label: 'Informações pessoais',
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      validator: PhoneplanetValidators.noNullableValidator,
                      decoration: const InputDecoration(
                        label: Text('Nome'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      validator: PhoneplanetValidators.emailValidator,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _birthdayController,
                      validator: PhoneplanetValidators.birthdayValidator,
                      decoration: const InputDecoration(
                        label: Text('Aniversário'),
                        hintText: 'Ex.: 12/12/2012',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: PhoneplanetButton.secondary(
                            onTap: () {
                              if (!_formKey.currentState!.validate()) return;
                              debugPrint('Pass');
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
