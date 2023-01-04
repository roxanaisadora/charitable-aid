import 'package:ac/models/donation_post_5.dart';
import 'package:flutter/cupertino.dart';


class DonationPost5FormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  DonationPost5 donationpost5;
  DonationPost5FormProvider(this.donationpost5);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}