import 'package:flutter/material.dart';

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
          color: Color.fromRGBO(248, 249, 250, 1),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(218, 219, 220, 1),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  width: 85,
                  height: 10,
                  margin: EdgeInsets.only(top: 5),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(text, style: TextStyle(fontSize: 18, color: Color.fromRGBO(52, 58, 64, 1)), textAlign: TextAlign.justify,),
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
                    child: const Text('Tentar novamente', style: TextStyle(color: Colors.white, fontSize: 16),),
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
      backgroundColor: Color.fromRGBO(248, 249, 250, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset("img/green_logo_text.png", width: 250,),
                  const Text(
                    'Bem vindo(a) de volta',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(52, 58, 64, 1)
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 32),
                        Text("Email", style: TextStyle(fontSize: 16, color: Color.fromRGBO(52, 58, 64, 1)), textAlign: TextAlign.left,),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(7))
                            ),
                            fillColor: Color.fromRGBO(215, 215, 215, 1),
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
                        Text("Senha", style: TextStyle(fontSize: 16, color: Color.fromRGBO(52, 58, 64, 1)), textAlign: TextAlign.left,),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(7))
                            ),
                            fillColor: Color.fromRGBO(215, 215, 215, 1),
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
                              onChanged: (value) {
                                setState(() {
                                  _stayConnected = value ?? false;
                                });
                              },
                            ),
                            const Text('Manter-me conectado', style: TextStyle(color: Color.fromRGBO(52, 58, 64, 1)),),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              
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
                          child: const Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              
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
                          child: const Text('Esqueci minha senha', style: TextStyle(color: Color.fromRGBO(0, 200, 74, 1), fontSize: 16),),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        
                      });
                    },
                    child: const Text("Não possuo uma conta"),
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