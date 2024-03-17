import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rayik/core/bloc/internet_bloc/states.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'event.dart';




class InternetBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity connectivity;
  late StreamSubscription connectivitySubscription;

  InternetBloc({required this.connectivity}) : super(InitialConnectivityState()) {
    on<ListenConnectivity>((event, emit) async {
      await _listenConnection(emit);
    });

    on<ConnectivityChanged>((event, emit) async {
      if (event.isConnected) {
        debugPrint('Internet Connected');
        emit(InternetConnected());
      } else {
        debugPrint('Internet Disconnected');
        emit(InternetDisconnected());
      }
    });

    // Check initial connectivity status
    checkInitialConnectivity();
  }

  Future<void> _listenConnection(Emitter<ConnectivityState> emit) async {
    connectivitySubscription = connectivity.onConnectivityChanged.listen((result) {
      add(ConnectivityChanged(result != ConnectivityResult.none));
    });
  }

  // New method to check initial connectivity
  void checkInitialConnectivity() async {
    var result = await connectivity.checkConnectivity();
    add(ConnectivityChanged(result != ConnectivityResult.none));
  }

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}