import 'dart:async';
import 'package:rxdart/rxdart.dart';
class Bloc extends Object with Validator implements BaseBloc{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();


  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;


  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get submitCheck => Rx.combineLatest2(email, password, (e, p) => true);

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController?.close();
    _passwordController?.close();
  }
}

abstract class BaseBloc{
  void dispose();
}

mixin Validator{
  var emailValidator = StreamTransformer<String,String>.fromHandlers(

    handleData: (email,sink){
      if(email.contains("@")){
        sink.add(email);
      } else {
        sink.addError("Enter proper Email");
      }
    }
  );

  var passwordValidator = StreamTransformer<String,String>.fromHandlers(

      handleData: (password,sink){
        if(password.length <= 6){
          sink.add(password);
        } else {
          sink.addError("Passsword must be of 6 characters");
        }
      }
  );


}