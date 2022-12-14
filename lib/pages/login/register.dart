import 'package:ac/providers/provider_login.dart';
import 'package:ac/route/route.dart';
import 'package:ac/services/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 240,
                  child: Image.asset('assets/image/logo_login.png'),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'REGISTRATE',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ChangeNotifierProvider(
                  create: (context) => ProviderLogin(),
                  child: _LoginForm(),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, MyRoutes.rLogin);
                  },
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  bool _ispassword = true;

  void _viewPassword() {
    setState(() {
      _ispassword = !_ispassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<ProviderLogin>(context);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: loginProvider.formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: _buildDecoration(
                  hintText: 'correo@xxx.com',
                  labeltext: 'E-mail',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                ),
                onChanged: (value) => loginProvider.email = value,
                validator: (value) {
                  String caracteres =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                  RegExp regExp = RegExp(caracteres);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'No es un correo NO valido';
                },
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                autocorrect: false,
                obscureText: _ispassword,
                keyboardType: TextInputType.text,
                decoration: _buildDecoration(
                  hintText: '********',
                  labeltext: 'Password',
                  prefixIcon: const Icon(
                    Icons.key_outlined,
                    color: Colors.black,
                  ),
                  suffixIcon: InkWell(
                    onTap: _viewPassword,
                    child: Icon(
                      color: Colors.black,
                        _ispassword ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                onChanged: (value) => loginProvider.password = value,
                validator: (value) {
                  return (value != null && value.length >= 8)
                      ? null
                      : 'Debe tener minimo 8 caracteres';
                },
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  disabledColor: Colors.black,
                  elevation: 10,
                  color: Color.fromARGB(255, 43, 56, 91),
                  onPressed: loginProvider.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          final authService =
                              Provider.of<AuthService>(context, listen: false);

                          if (!loginProvider.isValidForm()) return;

                          loginProvider.isLoading = true;

                          final String? errorMessage =
                              await authService.createUser(
                                  loginProvider.email, loginProvider.password);

                          if (errorMessage == null) {
                            CustomSnackbbar.verSnackbar(
                                'Gracias por registrarte');
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(
                                context, MyRoutes.rHome);
                          } else {
                            loginProvider.isLoading = false;
                          }
                        },
                  child: (loginProvider.isLoading)
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'REGISTRAR',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration _buildDecoration({
  final String? hintText,
  final String? labeltext,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.white),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.black),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.black),
      borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.black),
      borderRadius: BorderRadius.circular(15),
    ),
    floatingLabelStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    labelText: labeltext,
    hintStyle: const TextStyle(color: Colors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(18),
  );
}