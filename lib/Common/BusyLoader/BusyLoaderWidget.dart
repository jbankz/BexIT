import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../Assets/AppColors.dart';
import '../../Core/Router/PageRouter.dart';
import '../Image/ImageView.dart';
import '../Image/Model/ImageConfig.dart';
import '../TextView/Models/TextViewConfig.dart';
import '../TextView/TextView.dart';
import 'Models/BusyConfig.dart';
import 'BusyLoaderViewModel.dart';

class BusyLoaderWidget<T> extends StatelessWidget {
  const BusyLoaderWidget({required this.config, super.key});

  final BusyConfig config;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BusyLoaderViewModel>.reactive(
        viewModelBuilder: () => BusyLoaderViewModel(),
        onViewModelReady: (model) async {
          T response = await model.runAsyncTask(config.awaitingTask);
          config.callback(response);
          PageRouter.pop();
        },
        builder: (_, viewmodel, __) => WillPopScope(
              onWillPop: () async => viewmodel.isBusy ? false : true,
              child: Scaffold(
                body: Stack(
                  children: [
                    ImageView(
                        imageConfig: ImageConfig(
                            imageURL: '',
                            imageType: ImageType.svg,
                            width: double.infinity,
                            height: double.infinity,
                            boxFit: BoxFit.cover)),
                    Align(
                      alignment: Alignment.center,
                      child: TextView(
                        config: TextViewConfig(
                          text: config.title,
                          color: AppColors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
