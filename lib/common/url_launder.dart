import 'package:url_launcher/url_launcher.dart';

void launchUrlFunc(Uri url) async{
  if(await canLaunchUrl(url)){
    launchUrl(url);
  }
}