import 'dart:io';

import 'package:atlanta_demo/bloc/user_events.dart';
import 'package:atlanta_demo/bloc/user_states.dart';
import 'package:atlanta_demo/model/user.dart';
import 'package:atlanta_demo/repo/database_repo.dart';
import 'package:atlanta_demo/repo/network_call.dart';
import 'package:atlanta_demo/repo/notification_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class UsersBloc extends Bloc<UsersEvents, UsersState> {
  final UserRepository usersRepository;
  List<User> _users;
  List<Map> _searchedUsers;

  Database db;

  UsersBloc({@required this.usersRepository}) : super(UsersInitialState());

  @override
  Stream<UsersState> mapEventToState(UsersEvents event) async* {
    if (event is FetchUsers) {
      await _initializeDataBase();
      yield UsersLoadingState();

      try {
        _users = await UserRepository.getUser();
        _saveData(_users);
        yield UsersLoadedState(users: _users);
      } on SocketException {
        yield UsersListErrorstate(
          error: ('No Internet'),
        );
      } on HttpException {
        yield UsersListErrorstate(
          error: ('No Service'),
        );
      } on FormatException {
        yield UsersListErrorstate(
          error: ('No Format Exception'),
        );
      } catch (e) {
        print(e.toString());
        yield UsersListErrorstate(
          error: ('Un Known Error ${e.toString()}'),
        );
      }
    } else if (event is StartSearch) {
      await _getSearchedUsers(event.searchPrhase);
      yield UsersSearchingState(searchedUsers: _searchedUsers);
    } else if (event is ShowNotification) {
      await _showNotification();
      yield UserTappedNotification();
    }
  }

  Future<void> _initializeDataBase() async {
    await Repository().open();
    db = Repository().db;
  }

  Future<void> _showNotification() async {
    await NotificationApi.showNotification(
        id: 0,
        title: "Adarsh's simple Notification",
        body: "Hey there! This notification was created by Adarsh",
        payload: 'Adarsh.Ag');
  }

  _saveData(data) async {
    for (var item in data) {
      await User.insert(db, item);
    }
  }

  _getSearchedUsers(searchedPhrase) async {
    _searchedUsers =
        await User.getItems(db, name: searchedPhrase, id: searchedPhrase);
  }
}
