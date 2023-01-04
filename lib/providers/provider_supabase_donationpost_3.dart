import 'package:ac/models/donation_post_3.dart';
import 'package:flutter/cupertino.dart';


class DonationPost3FormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  DonationPost3 donationpost3;
  DonationPost3FormProvider(this.donationpost3);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}