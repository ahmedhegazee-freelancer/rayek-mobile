import 'package:agora_uikit/agora_uikit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/general_utils/general_utils.dart';

part 'video_call_state.dart';

class VideoCallCubit extends Cubit<VideoCallState> {
  VideoCallCubit() : super(VideoCallInitial());
  static VideoCallCubit get(context) => BlocProvider.of(context);
  initCALLing(String channel, String token) async {
    GeneralUtils.client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: "ebedb16591844d4a8bcb6e06fd166474",
          // channelName: "messenger-channel.${widget.id}",
          channelName: channel,
          tempToken: token
          //  "007eJxTYBBTs3+z/d1m480fA02qGzlkdS3/vT6i1eDAFbGH+Y/RQh0FBrPUZDNjSwtLA0NzIxNLg9TERFNz88S0pCTjlLTENONkaRnxlIZARoZ7XloMjFAI4nMyJGck5uWl5sQbMTAAAGLXHtw=",
          ),
    );
    await GeneralUtils.client.initialize();
    emit(DoneVideo());
  }
}
