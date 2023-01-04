import 'package:ac/models/donation_post_1.dart';
import 'package:flutter/cupertino.dart';


class DonationPost2FormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  DonationPost1 donationpost1;
  DonationPost2FormProvider(this.donationpost1);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}