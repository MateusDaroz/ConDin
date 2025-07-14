import 'package:condin/features/auth/view/register.dart';
import 'package:condin/features/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _stayConnected = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  int _modalCounter = 0;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void showErrorModal(String text){
    if(_modalCounter!=0){
      return;
    }
    else {
      _modalCounter++;
      showModalBottomSheet(
      context: context, 
      builder: (BuildContext context){
        return Container(
          height: 150,
          color: Theme.of(context).colorScheme.surface,
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(218, 219, 220, 1),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  width: 70,
                  height: 5,
                  margin: EdgeInsets.only(top: 10),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(text, style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _modalCounter--;
                        Navigator.pop(context);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 200, 74, 1),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      shadowColor: Colors.transparent
                    ),
                    child: const Text('Tentar novamente', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
          )
        );
      }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset("img/green_logo_text.png", width: 250,),
                  Text(
                    'Bem-vindo(a) de volta',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 32),
                        Text("Email", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary), textAlign: TextAlign.left,),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(7))
                            ),
                            fillColor: Theme.of(context).colorScheme.secondaryContainer,
                            filled: true
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              showErrorModal('Erro de credenciais. O campo "Email" está vazio!');
                              return null;
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              showErrorModal('Erro de credenciais. O campo "Email" não possui um formato válido!');
                              return null;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Text("Senha", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary), textAlign: TextAlign.left,),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(7))
                            ),
                            fillColor: Theme.of(context).colorScheme.secondaryContainer,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color.fromRGBO(105, 105, 105, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              showErrorModal('Erro de credenciais. O campo "Senha" está vazio!');
                              return null;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Checkbox(
                              value: _stayConnected,
                              activeColor: Color.fromRGBO(0, 200, 74, 1),
                              onChanged: (value) {
                                setState(() {
                                  _stayConnected = value ?? false;
                                });
                              },
                            ),
                            Text('Manter-me conectado', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _modalCounter=0;
                            });
                            if (_formKey.currentState!.validate()) {
              
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(0, 200, 74, 1),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            shadowColor: Colors.transparent
                          ),
                          child: const Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              side: BorderSide(
                                color: Color.fromRGBO(0, 200, 74, 1),
                                width: 3,
                              ),
                            ),
                            shadowColor: Colors.transparent
                          ),
                          child: const Text('Esqueci minha senha', style: TextStyle(color: Color.fromRGBO(0, 200, 74, 1), fontSize: 16, fontWeight: FontWeight.bold),),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Register()));
                      });
                    },
                    child: const Text("Não possuo uma conta",style: TextStyle(color: Color.fromRGBO(0, 200, 74, 1), fontWeight: FontWeight.w600)),
                  ),
                ]
              )
            ),
          )
        )
      ),
    );
  }
}