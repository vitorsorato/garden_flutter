import 'package:flutter/material.dart';
import 'package:garden/services.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  final Function toggleScreen;

  const Register({Key? key, required this.toggleScreen}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Text("Bem-vindo(a)",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Registre-se para continuar..",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (val) =>
                        val!.isNotEmpty ? null : "Informe seu email",
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: const Icon(Icons.mail),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (val) => val!.length < 6
                        ? "A senha deve ter pelo menos 6 caracteres"
                        : null,
                    decoration: InputDecoration(
                        hintText: "Senha",
                        prefixIcon: const Icon(Icons.vpn_key),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        print("Email: ${_emailController.text}");
                        print("Email: ${_passwordController.text}");
                        await loginProvider.register(
                            _emailController.text.trim(),
                            _passwordController.text.trim());
                      }
                    },
                    height: 70,
                    minWidth: loginProvider.isLoading ? null : double.infinity,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: loginProvider.isLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          )
                        : const Text(
                            "Registrar",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Possui conta?"),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          widget.toggleScreen();
                        },
                        child: const Text("Entrar"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (loginProvider.errorMessage.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(loginProvider.errorMessage),
                        leading: const Icon(Icons.error),
                        trailing: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => loginProvider.setMessage(null),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
