import 'package:ac/pages/category/social_aid/donation_screen.dart';
import 'package:ac/providers/donation_verification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ac/providers/provider_supabase.dart';
import 'package:ac/services/dato_supabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class PaymentScreenn extends StatelessWidget {
  final String? img;
  const PaymentScreenn({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    final donationService = Provider.of<DonationesService>(context);
    return ChangeNotifierProvider(
      create: (_) => DonationFormProvider(donationService.seleccionarLugar),
      child: PaymentScreen(donationService: donationService),
    );
  }
}
class PaymentScreen extends StatefulWidget {
  final DonationesService donationService;
  const PaymentScreen({super.key, required this.donationService});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Muchas Gracias",
      desc: "Con tu aporte estas ayudando a quien mas lo necesita",
      image: Image.asset("assets/image/amigos.jpg"),
      buttons: [
        DialogButton(
          // ignore: sort_child_properties_last
          child: const Text(
            "Cerrar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final donationProvider = Provider.of<DonationVerificationProvider>(context);
    final donationForm = Provider.of<DonationFormProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: donationForm.formkey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ).copyWith(bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Métodos de Ayuda',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TabBar(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        return states.contains(MaterialState.focused)
                            ? null
                            : Colors.transparent;
                      },
                    ),
                    labelPadding: const EdgeInsets.symmetric(vertical: 10),
                    controller: _tabController,
                    indicator: CircleTabIndicator(
                      color: Colors.green,
                      radius: 4,
                    ),
                    tabs: const [
                      PaymentMethodIcon(
                        asset:
                            'https://peruconnection.com.pe/wp-content/uploads/2021/11/9877sd.png',
                      ),
                      PaymentMethodIcon(
                        asset:
                            'https://seeklogo.com/images/P/plin-logo-967A4AF583-seeklogo.com.png',
                      ),
                      PaymentMethodIcon(
                        asset:
                            'https://seeklogo.com/images/T/tunki-logo-8BAD04C387-seeklogo.com.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        PaymentMethodInfo(
                          accountHolder: 'James Bond',
                          phoneNumber: 962230583,
                          payMethodName: 'Yape',
                        ),
                        PaymentMethodInfo(
                          accountHolder: 'James Bond 2',
                          phoneNumber: 967278223,
                          payMethodName: 'Plin',
                        ),
                        PaymentMethodInfo(
                          accountHolder: 'James Bond 3',
                          phoneNumber: 936715353,
                          payMethodName: 'Tunki',
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Fotos :',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint('camera pressed');
                          donationProvider.activateGallery();
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0XFFF5F5F5),
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: Color(0XFFB3C0C7),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      donationProvider.image == null
                          ? const Text(
                              'Adjuntar imagen del donativo',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFFB3C0C7),
                              ),
                            )
                          : Stack(
                              alignment: Alignment.topRight,
                              clipBehavior: Clip.none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Image.file(
                                      donationProvider.image!,
                                      fit: BoxFit.cover,
                                      frameBuilder: (BuildContext context,
                                          Widget child,
                                          int? frame,
                                          bool wasSynchronouslyLoaded) {
                                        if (wasSynchronouslyLoaded) {
                                          return child;
                                        }
                                        return AnimatedOpacity(
                                          opacity: frame == null ? 0 : 1,
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeOut,
                                          child: child,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -14,
                                  child: InkWell(
                                    onTap: () {
                                      donationProvider.cleanImage();
                                    },
                                    child: Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.redAccent.shade700,
                                      size: 28,
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  /* AmountDonationTextField(
                    onChanged: (value) {},
                  ), */
                  const Text(
                    'Monto donado:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                 const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      'S/. 200',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ).copyWith(
          top: 0,
        ),
        width: double.infinity,
        child: MyRoundedButton(
          label: 'Donar',
          onPressed: () {
                        widget.donationService.crearOactualizar(donationForm.donation);
                        Navigator.pushNamed(context, '/home');
                        _onBasicAlertPressed(context);
                      },
        ),
      ),
    );
  }
}

class AmountDonationTextField extends StatelessWidget {
  final Function(String)? onChanged;
  const AmountDonationTextField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 45.0,
      ),
      child: TextField(
        //controller: ,
        onChanged: onChanged!,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
          ),
          hintText: 'Ingresa el monto donado',
          filled: true,
          fillColor: const Color.fromARGB(255, 237, 240, 249),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class PaymentMethodInfo extends StatelessWidget {
  const PaymentMethodInfo({
    Key? key,
    required this.phoneNumber,
    required this.accountHolder,
    required this.payMethodName,
  }) : super(key: key);
  final int phoneNumber;
  final String accountHolder;
  final String payMethodName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Número de $payMethodName: $phoneNumber',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0XFFB3C0C7),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            'Titular: $accountHolder',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0XFFB3C0C7),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/754/754637.png',
              height: 85,
              width: 85,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }
}

class PaymentMethodIcon extends StatelessWidget {
  const PaymentMethodIcon({
    Key? key,
    required this.asset,
  }) : super(key: key);
  final String asset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(
        // 'assets/image/logo.jpg',
        asset,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
        frameBuilder: (BuildContext context, Widget child, int? frame,
            bool wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            child: child,
          );
        },
      ),
    );
  }
  /* Image.asset(
        // 'assets/image/logo.jpg',
        asset,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
        frameBuilder: (BuildContext context, Widget child, int? frame,
            bool wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            child: child,
          );
        },
      ), */
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
