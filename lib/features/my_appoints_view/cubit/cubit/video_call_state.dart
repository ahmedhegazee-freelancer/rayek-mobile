part of 'video_call_cubit.dart';

@immutable
sealed class VideoCallState {}

final class VideoCallInitial extends VideoCallState {}

final class DoneVideo extends VideoCallState {}
