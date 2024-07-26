
import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/route_names.dart';
import 'package:mvvm_with_provider/view_model/get_view_model.dart';
import 'package:mvvm_with_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';
import '../resources/components/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GetViewModel getViewModel;

  @override
  void initState() {
    super.initState();
    getViewModel = GetViewModel();
    getViewModel.get(); // Fetch data when the screen is loaded
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.teal,
        automaticallyImplyLeading: false,
        title: const Text("Home Screen"),
      ),
      body: ChangeNotifierProvider<GetViewModel>(
        create: (BuildContext context) => getViewModel,
        child: Consumer<GetViewModel>(
          builder: (context, value, child) {
            switch (value.getData.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.error:
                return Center(child: Text(value.getData.message.toString()));
              case Status.completed:
                return ListView.builder(
                  itemCount: value.getData.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: Colors.blueGrey.shade100,
                        child: ListTile(
                        title: Text(value.getData.data!.data![index].firstName.toString()),
                        subtitle:  Text(value.getData.data!.data![index].lastName.toString()),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(
                            value.getData.data!.data![index].avatar.toString(),
                          ),
                        ),
                          leading: Text(index.toString()),
                        ),
                      ),
                    );
                  },
                );
              default:
                return Center(child: Text("Default"));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        userViewModel.removeUser();
        Navigator.pushReplacementNamed(context, RouteName.login);

      },child: Text("Logout"),)
    );
  }
}
