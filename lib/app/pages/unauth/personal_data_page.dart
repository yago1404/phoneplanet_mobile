import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/components/buttons/phoneplanet_button.dart';
import 'package:phoneplanet/design_system/components/phoneplanet_title_header.dart';
import 'package:phoneplanet/design_system/styles/phoneplanet_text_styles.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
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
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      label: Text('Nome'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _birthdayController,
                    decoration: const InputDecoration(
                      label: Text('Aniversário'),
                      hintText: 'Ex.: 12/12/2012',
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: PhoneplanetButton.secondary(
                          onTap: () {},
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
