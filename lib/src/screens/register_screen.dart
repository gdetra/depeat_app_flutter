import 'package:depeat_flutter_app/src/blocs/auth_provider.dart';
import 'package:depeat_flutter_app/src/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget with TextFields {
  @override
  Widget build(BuildContext context) {
    final bloc = AuthProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(child: Column(
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            buildEmail(bloc),
            Container(
              margin: EdgeInsets.only(top: 32.0),
            ),
            buildPassword(bloc),
            Container(
              margin: EdgeInsets.only(top: 32.0),
            ),
            buildUser(bloc),
            Container(
              margin: EdgeInsets.only(top: 32.0),
            ),
            buildRegisterButton(bloc),
          ],
        ),)
      ),
    );
  }
}
