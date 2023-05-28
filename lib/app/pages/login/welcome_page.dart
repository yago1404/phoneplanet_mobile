import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/components/phoneplanet_title_header.dart';
import 'package:phoneplanet/design_system/phoneplanet_colors.dart';
import 'package:phoneplanet/design_system/styles/phoneplanet_text_styles.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PhoneplanetTitleHeader(
            title: 'Vamos dar um Upgrade nos seus aparelhos Apple',
            label: 'Faça login para ver nossos produtos',
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        PhoneplanetColors.secondary,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.mail_outline,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Continuar com E-mail',
                          style: PhoneplanetTextStyles.label.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: PhoneplanetColors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Ou entre em contato',
                  style: PhoneplanetTextStyles.label,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: PhoneplanetColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Wahtsapp'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Instagram'),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: RichText(
              text: TextSpan(
                text: 'Ainda não tem uma conta?',
                style: PhoneplanetTextStyles.label.copyWith(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: ' Criar uma conta',
                    style: PhoneplanetTextStyles.label.copyWith(
                      color: PhoneplanetColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
