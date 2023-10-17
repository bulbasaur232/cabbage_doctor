import 'package:bug_doctor/common/w_navigationbar.dart';
import 'package:bug_doctor/license/oss_licenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class LicencesPage extends StatelessWidget {
  const LicencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: navigationBar(title: '소스 출처'),
      child: SafeArea(
        child: ListView.builder(
          physics: const RangeMaintainingScrollPhysics(),
          itemCount: ossLicenses.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.lightBackgroundGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CupertinoListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => LicenceDetailPage(
                          title: ossLicenses[index].name[0].toUpperCase() +
                              ossLicenses[index].name.substring(1),
                          licence: ossLicenses[index].license!,
                        ),
                      ),
                    );
                  },
                  //capitalize the first letter of the string
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Text(
                      ossLicenses[index].name[0].toUpperCase() +
                          ossLicenses[index].name.substring(1),
                      style: GoogleFonts.roboto(),
                    ),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                        text: ossLicenses[index].description,
                        style: const TextStyle(
                            color: CupertinoColors.inactiveGray)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//detail page for the licence
class LicenceDetailPage extends StatelessWidget {
  final String title, licence;

  const LicenceDetailPage(
      {super.key, required this.title, required this.licence});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title, style: const TextStyle(fontSize: 20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: SingleChildScrollView(
              physics: const RangeMaintainingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    licence,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
