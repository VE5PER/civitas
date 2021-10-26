import 'package:civitas/sidedrawer.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool valuelock=false,valuefinger=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_rounded),),
      ),
      body:
        SettingsList(
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          sections: [
            SettingsSection(
              title: 'App Preferences',
              tiles: const [
                SettingsTile(
                    title: 'Language',
                  subtitle: 'English',
                  leading: Icon(Icons.language_rounded),
                )
              ],
            ),
            SettingsSection(
              title: 'Security',
              tiles:  [
                SettingsTile.switchTile(
                  title: 'Lock app in background',
                  leading: Icon(Icons.phonelink_lock),
                  switchValue: valuelock,
                  onToggle: (bool value){
                    setState(() {
                      valuelock=value;
                    });
                  },

                ),
                SettingsTile.switchTile(
                  title: 'Use fingerprint',
                  leading: Icon(Icons.fingerprint_rounded),
                  switchValue: valuefinger,
                  onToggle: (bool value){
                    setState(() {
                      valuefinger=value;
                    });
                  },
                )
              ],
            ),
            SettingsSection(
              title: 'Misc',
              tiles:  [
                SettingsTile(
                  title: 'Terms of Service',
                  leading: Icon(Icons.description_rounded),
                    onPressed: (BuildContext context){}
                ),
                SettingsTile(
                  title: 'Privacy Policy',
                  leading: Icon(Icons.privacy_tip_rounded),
                  onPressed: (BuildContext context){},
                ),
                SettingsTile(
                  title: 'App Version',
                  subtitle: '0.0.3',
                  leading: Icon(Icons.perm_device_info_rounded),
                    onPressed: (BuildContext context){}
                )
              ],
            )          ],
        )
    );
  }
}
