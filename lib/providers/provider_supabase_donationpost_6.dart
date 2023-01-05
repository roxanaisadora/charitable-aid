import 'package:ac/models/donation_post_6.dart';
import 'package:flutter/cupertino.dart';


class DonationPost6FormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  DonationPost6 donationpost6;
  DonationPost6FormProvider(this.donationpost6);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}