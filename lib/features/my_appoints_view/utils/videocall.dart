import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/general_utils/general_utils.dart';
import '../cubit/cubit/video_call_cubit.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({super.key, required this.token, required this.channel});
  final String token;
  final String channel;

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: BlocProvider(
          create: (context) =>
              VideoCallCubit()..initCALLing(widget.channel, widget.token),
          child: BlocConsumer<VideoCallCubit, VideoCallState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              final cubit = VideoCallCubit.get(context);

              return GeneralUtils.client.isInitialized
                  ? Stack(
                      children: [
                        AgoraVideoViewer(
                          client: GeneralUtils.client,
                          // enableHostControls: true,
                          // showNumberOfUsers: true,       // showAVState: true,

                          layoutType: Layout.oneToOne,
                        ),
                        AgoraVideoButtons(client: GeneralUtils.client),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Stack(
      //       children: [
      //         AgoraVideoViewer(client: client),
      //         AgoraVideoButtons(client: client),
      //       ],
      //     ),
      //     // Expanded(
      //     //   child: Row(
      //     //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //     crossAxisAlignment: CrossAxisAlignment.center,
      //     //     children: [
      //     //       IconButton(
      //     //         onPressed: () {},
      //     //         icon: Icon(Icons.mic_off_outlined),
      //     //       ),
      //     //       GestureDetector(
      //     //         onTap: () {
      //     //           Navigator.pop(context);
      //     //         },
      //     //         child: CircleAvatar(
      //     //           radius: 30,
      //     //           backgroundColor: AppColors.red,
      //     //           child: Image.asset(
      //     //             'ic_call'.png(),
      //     //             color: AppColors.white,
      //     //             width: 26,
      //     //             height: 26,
      //     //             fit: BoxFit.fill,
      //     //           ),
      //     //         ),
      //     //       ),
      //     //       IconButton(
      //     //         onPressed: () {},
      //     //         icon: Icon(Icons.videocam_off_outlined),
      //     //       ),
      //     //     ],
      //     //   ),
      //     // )

      //   ],
      // ),
    );
  }
}
