import 'package:ac/models/model_supabase_ayuda.dart';
import 'package:flutter/cupertino.dart';


class HelpFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool dato1 = false;
  bool dato2 = false;
  bool dato3 = false;
  Help help;
  HelpFormProvider(this.help);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }

  btncambiar(){
    (dato1 == false)?(dato1 = true):(dato1 = false);
    print(dato1);
    notifyListeners();
  }

  btncambiar2(){
    (dato2 == false)?(dato2 = true):(dato2 = false);
    print(dato2);
    notifyListeners();
  }

  btncambiar3(){
    (dato3 == false)?(dato3 = true):(dato3 = false);
    print(dato3);
    notifyListeners();
  }
}