import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class BackupOffPage extends StatelessWidget {
  const BackupOffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: Color(0xff121b22),
        isChildWidget: true,
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Image.asset('images/backup_off.png'),
            const SizedBox(height: 20.0),
            const Text(
              'End-to-end encrypted backup is off',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30.0),
            Text(
              data.textData['endToEndbackup']![0],
              style: kInfoTextStyle2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            CustomRichText(
              textAlign: TextAlign.center,
              textList: [
                {
                  data.textData['endToEndbackup']![1][0]: kInfoTextStyle2,
                  data.textData['endToEndbackup']![1][1]:
                      kInfoTextStyle2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  data.textData['endToEndbackup']![1][2]: kInfoTextStyle2,
                  data.textData['endToEndbackup']![1][3]:
                      kInfoTextStyle2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                }
              ],
            ),
            const Spacer(),
            Row(
              children: const [
                Expanded(
                  child: CustomButton(
                    title: 'Turn on',
                    routeName: '/createEncryptionPage',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}
