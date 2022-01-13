import 'package:atlanta_demo/model/user.dart';
import 'package:flutter/material.dart';

Widget buildList(BuildContext context, List<User> users, List searchedUser,
    {isFromSearchedData = false}) {
  if (isFromSearchedData) {
    searchedUser = searchedUser.sublist(0, 1);
  }
  return ListView.builder(
    itemCount: isFromSearchedData ? searchedUser.length : users.length,
    itemBuilder: (_, index) {
      var user = isFromSearchedData ? searchedUser[index] : users[index];

      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isFromSearchedData
                      ? Text('Name: ${user['name']}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ))
                      : Text(
                          'Name: ${user.name}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                  Divider(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  isFromSearchedData
                      ? Text('User Name: ${user['userName']}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ))
                      : Text(
                          'User Name: ${user.userName}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                  Divider(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  isFromSearchedData
                      ? Text('email: ${user['email']}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ))
                      : Text(
                          'email: ${user.email}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                  Divider(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  isFromSearchedData
                      ? Text('Phone no: ${user['phone']}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ))
                      : Text(
                          'Phone no: ${user.phone}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                        ),
                  Divider(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  isFromSearchedData
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            child: Text(
                              'Address: ${user.address.city}  ${user.address.street}',
                              style: TextStyle(
                                fontSize: 20,
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                              ),
                            ),
                          ),
                        ),
                  isFromSearchedData
                      ? Container()
                      : Container(
                          child: Text(
                            '${user.address.suite}  ${user.address.zipCode} ',
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                            ),
                          ),
                        ),
                  isFromSearchedData
                      ? Container()
                      : Divider(
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                  isFromSearchedData
                      ? Container()
                      : Container(
                          child: Text(
                            'Company: ${user.company.name} ${user.company.catchPhrase} ${user.company.bs}',
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                            ),
                          ),
                        ),
                  isFromSearchedData
                      ? Container()
                      : Divider(
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                  Container(
                    child: isFromSearchedData
                        ? Text('Website: ${user['website']}',
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                            ))
                        : Text(
                            'Website: ${user.website}',
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                            ),
                          ),
                  ),
                  Divider(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
