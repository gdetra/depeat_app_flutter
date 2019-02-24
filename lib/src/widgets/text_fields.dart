import 'package:depeat_flutter_app/src/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';

class TextFields {
  Widget buildUser(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.user,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.addUser,
          decoration: InputDecoration(
            hintText: 'username',
            labelText: 'Enter User',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget buildEmail(AuthBloc bloc) {
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

  Widget buildPassword(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.addPassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'password',
            labelText: 'Enter Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget buildLoginButton(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.validLogin,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData
              ? () async{
                  await bloc.doLogin();
                  bloc.authenticated.listen((auth){
                    if(auth){
                      Navigator.pop(context);
                    }
                  });
                }
              : null,
          color: Colors.blue,
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  Widget buildRegisterButton(AuthBloc bloc) {
    return StreamBuilder(
      stream: bloc.validRegister,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData
              ? () async {

                 await bloc.doRegister();
                 bloc.authenticated.listen((auth){
                   if(auth){
                     Navigator.of(context).popUntil((route) => route.isFirst);
                   }
                 });
                }
              : null,
          color: Colors.blue,
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
