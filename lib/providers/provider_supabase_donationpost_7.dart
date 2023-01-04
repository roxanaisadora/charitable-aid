import 'package:ac/models/donation_post_7.dart';
import 'package:flutter/cupertino.dart';


class DonationPost7FormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  DonationPost7 donationpost7;
  DonationPost7FormProvider(this.donationpost7);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}