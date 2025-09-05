import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/dialog_service.dart';
import '../../../../core/widgets/app_dialog.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              DialogService().showAppDialog(
                AppDialog(
                  title: "登录成功",
                  message: "欢迎回来！",
                  confirmText: "确定",
                  onConfirm: () => Navigator.pop(context),
                ),
              );
            },
            child: const Text("Show app dialog"),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              SystemChannels.textInput.invokeMethod("TextInput.show");
              DialogService().showBottomSheet(
                DraggableScrollableSheet(
                  initialChildSize: 0.8,
                  minChildSize: 0.8 * 0.6,
                  maxChildSize: 0.9,
                  expand: false,
                  // 允许底部滑动
                  builder: (context, scrollController) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.paddingOf(context).bottom,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 6.h,
                            width: 49.w,
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                          ),
                          const Text('登录成功'),
                          const Text('欢迎回来'),
                          Expanded(
                            child: NotificationListener<ScrollNotification>(
                              onNotification: (notification) {
                                return false;
                              },
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: 12,
                                itemBuilder: (cx, index) => Text('$index'),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('取消'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('确定'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            child: Text("Show bottomSheet"),
          ),
        ],
      ),
    );
  }
}
