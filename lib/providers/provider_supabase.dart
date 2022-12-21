import 'package:ac/models/modelo_supabase.dart';
import 'package:flutter/cupertino.dart';


class DonationFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Donation donation;
  DonationFormProvider(this.donation);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}