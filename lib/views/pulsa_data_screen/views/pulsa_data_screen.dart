import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payoll/utils/constant.dart';
import '../widgets/data_content_widget.dart';
import '../widgets/pulsa_content_widget.dart';

class PulsaDataScreen extends StatelessWidget {
  static const String routeName = 'pulsa_data_screen';

  const PulsaDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 70.0,
        backgroundColor: const Color(0xff396EB0),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 30.0,
          ),
        ),
        title: const Text(
          'Pulsa & Data',
          style: TextStyle(fontSize: Constant.fontTitle, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xff396EB0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nomor HP',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                  onChanged: (value) {},
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(12),
                                  ],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(top: 16.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFEAEBEF))),
                                      filled: true,
                                      fillColor: const Color(0xFFF6F6F6),
                                      prefixIcon: Image.asset(
                                        'assets/icons/xl.png',
                                        scale: 1.8,
                                      ),
                                      hintText: '087xxxxxxxxx',
                                      hintStyle: const TextStyle(
                                          color: Color(0xFF99A1B5)))),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Image.asset(
                              'assets/icons/contact-book.png',
                              height: 30.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const TabBar(
                    indicatorColor: Color(0xff396EB0),
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: 'Pulsa',
                      ),
                      Tab(text: 'Data'),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.62,
                    child: const TabBarView(children: [
                      PulsaContentWidget(),
                      DataContentWidget(),
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
