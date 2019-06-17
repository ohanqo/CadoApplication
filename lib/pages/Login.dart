import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();

}

class _LoginPageState extends State <LoginPage> {
  @override

  Widget build(BuildContext context){

    final logo = Hero(
      tag:'hero',
      child:CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 78.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: 19.0
          ),
          labelText: 'Email',

        //hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:OutlineInputBorder(
             // borderSide: BorderSide(color: Colors.pink),
              borderRadius: BorderRadius.circular(12.0)

          )

      ),
    );


    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: 19.0
          ),
          labelText: 'Mot de passe',
         // hintText: 'Mot de passe',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0)
          )
      ),
    );


    final loginButton = Padding(

      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
     // padding: EdgeInsets.only(left: 94.0, right:94.0),

     // padding: EdgeInsets.symmetric(vertical: 36.0),
      child:Material(
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        color: Colors.pink,
        //elevation: 5.0,
        child: MaterialButton(
          //color: Colors.green,
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){},
          child: Text('Connexion',style:TextStyle(color: Colors.white,fontSize: 17.0)),
        ),

        ),
    );



    _forgotLabel() {
      return Padding(
        padding: EdgeInsets.all(0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
              ),
            ),
           // SizedBox(width: 15.0),
            Expanded(
                child: Container(
                  child: FlatButton(
                    child: Text(
                      'Mot de passe oublié?',
                      style:TextStyle(color: Colors.pink ,fontSize: 13.0),
                    ),
                    onPressed:() {},
                    ),
                ))
          ],
        ),
      );
    }



    _signUp() {
      return Padding(
        padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                  child: Text(
                    'Nouvel utilisateur?',
                    style:TextStyle(color: Colors.black54 ,fontSize: 13.0),
                    textAlign: TextAlign.end
                  ),
              ),
            ),
            Expanded(
                child: Container(
                  child: FlatButton(
                    child: Text(
                      'S\'enregistrer',
                      textAlign: TextAlign.start,
                      style:TextStyle(color: Colors.pink ,fontSize: 13.0),
                    ),
                    onPressed:() {},
                  ),
                ))
          ],
        ),
      );
    }



    return Scaffold(
        body:Stack(
          fit:StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/background.png'),fit:BoxFit.fill)),
            ),

            Column(
              children: <Widget>[
                Expanded(

                  child: ListView(
                      shrinkWrap:true,
                      padding: EdgeInsets.only(left: 34.0, right:34.0),

                   // padding: EdgeInsets.symmetric(vertical: 160.0),
                      children: <Widget>[
                        SizedBox(height: 70.0),
                        logo,
                        SizedBox(height: 30.0),
                        email,
                        SizedBox(height: 8.0),
                        password,
                         _forgotLabel(),
                        SizedBox(height: 8.0),
                        loginButton,
                        _signUp()
                      ],
                      ),

                  ),

              ],
            )
          ],

    ),
    );



    // return new Container();

  }

}


