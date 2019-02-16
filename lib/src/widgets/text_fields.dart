import 'package:depeat_flutter_app/src/blocs/login_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/register_bloc.dart';
import 'package:flutter/material.dart';

class TextFields{
  Widget buildUser(RegisterBloc bloc) {
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
            errorText: snapshot.error,),
        );
      },
    );
  }

  Widget buildLoginButton(LoginBloc bloc) {
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

  Widget buildRegisterButton(RegisterBloc bloc){
    return StreamBuilder(
      stream: bloc.canRegister,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData ? () {} : null,
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