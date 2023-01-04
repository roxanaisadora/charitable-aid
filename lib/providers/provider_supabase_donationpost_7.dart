import 'package:ac/models/donation_post.dart';
import 'package:flutter/cupertino.dart';


class DonationPost2FormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  DonationPost donationpost2;
  DonationPost2FormProvider(this.donationpost2);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}