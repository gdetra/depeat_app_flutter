import 'package:depeat_flutter_app/src/blocs/login_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/login_provider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            buildEmail(bloc),
            buildPassword(bloc),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            buildSubmit(bloc),
          ],
        ),
      ),
    );
  }

  Widget buildEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.addEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Enter Email',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget buildPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.addPassword,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'password',
              labelText: 'Enter Password',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget buildSubmit(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.valid,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData ? () {} : null,
          color: Colors.blue,
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
