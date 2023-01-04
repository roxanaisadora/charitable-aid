import 'package:ac/models/donation_post_4.dart';
import 'package:flutter/cupertino.dart';


class DonationPost4FormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  DonationPost4 donationpost4;
  DonationPost4FormProvider(this.donationpost4);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}