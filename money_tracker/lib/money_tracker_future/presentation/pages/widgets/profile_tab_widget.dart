
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class ProfileTabWidget extends StatelessWidget {
  const ProfileTabWidget({
    required this.statusUserProp,
    super.key});

  final StatusUserProp statusUserProp;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    var logoutProcess = false;
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 119,
            child: Hero(tag: Keys.heroIdSplash,
                child: CustomCircleAvatar(
                  uuid: statusUserProp.uuid,
                  loadImage: statusUserProp.loadImage,
                )
            ),
          ),
          SizedBox(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(statusUserProp.eMail, style: theme.textTheme.bodyMedium),
                13.h,
                ElevatedButton(onPressed: () {
                  if(logoutProcess) return;
                  logoutProcess = true;
                  LoginBlocInit.logout();
                  Navigator.of(context).pushReplacementNamed(r'\',
                    arguments: {
                      'loginUser': false,
                    },
                  );
                  logoutProcess = false;
                }, child: Text(S.of(context).exit),
                  style: theme.elevatedButtonTheme.style?.copyWith(
                    minimumSize: MaterialStatePropertyAll(Size(
                        MediaQuery.of(context).size.width-80-50-25,50
                    )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
