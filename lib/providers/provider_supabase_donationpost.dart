import 'package:ac/models/donation_post.dart';
import 'package:flutter/cupertino.dart';


class DonationPostFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  DonationPost donationpost55;
  DonationPostFormProvider(this.donationpost55);

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}