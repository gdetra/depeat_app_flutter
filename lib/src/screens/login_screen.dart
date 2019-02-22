import 'package:depeat_flutter_app/src/blocs/login_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/login_provider.dart';
import 'package:depeat_flutter_app/src/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget with TextFields {
  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            buildEmail(bloc),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            buildPassword(bloc),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            buildLoginButton(bloc),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/RegisterScreen");
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                    ),
                  ),
                )),
            buildIsAuth(bloc),
          ],
        ),
      ),
    );
  }

  Widget buildIsAuth(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.authenticated,
      builder: (context, AsyncSnapshot<bool> snapshot){
        if(!snapshot.hasData){
          return Text("Not authenticated");
        }
        if(snapshot.data){
          return Text("Authenticated");
        }else{
          return Text("Not Authenticated");
        }



      },
    );
  }
}
