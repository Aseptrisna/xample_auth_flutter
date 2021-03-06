import 'package:flutter_oauth_example/ui/shared/shared_style.dart';
import 'package:flutter_oauth_example/ui/shared/ui_helper.dart';
import 'package:flutter_oauth_example/viewmodels/startup_view_model.dart';
import 'package:flutter/material.dart';
//import 'package:provider_architecture/provider_architecture.dart';
import 'package:stacked/stacked.dart';

// import flutter services
import 'package:flutter/services.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lock Orientation Portait Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) {
        model.checkLoginStatus();
      },
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              verticalSpaceSmall,
              verticalSpaceSmall,
              const Text(
                'Survey PPTIK',
                style: titleTextStyle,
              ),
              verticalSpaceMedium,
              SizedBox(
                width: 300,
                height: 100,
                child: Image.asset('assets/logo.png'),
              ),
              verticalSpaceMedium,
              CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  )),
              verticalSpaceMedium,
              verticalSpaceMedium,
              Text(
                '1.1.3',
                style: textButtonTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}