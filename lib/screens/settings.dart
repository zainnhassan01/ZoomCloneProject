import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomcloneproject/services/providerclass.dart';

import '../services/firebaseauth.dart';
import '../widgets/settingsbutton.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SettingsButton(text: "Log Out", onPressed: () async{
      dynamic result = await AuthService().signOut();
      context.read<ProviderClass>().pageValue(0);
      if(result != null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: result));
      }
    }),
    );
  }
}