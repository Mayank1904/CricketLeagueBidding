import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_scaffold.dart';
import '../components/skipper_text.dart';
import '../cubits/upcomingMatches/upcoming_matches_cubit.dart';
import 'select_match_screen.dart';
import 'widgets/upcoming_match_tile.dart';

import '../../resources/constants/colors.dart';
import 'home/sidemenu/side_menu.dart';
import 'widgets/page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UpcomingMatchesCubit upcomingMatchesCubit;
  final _controller = PageController(
    viewportFraction: 0.9,
  );

  @override
  void initState() {
    super.initState();
    upcomingMatchesCubit = BlocProvider.of<UpcomingMatchesCubit>(context);
    upcomingMatchesCubit.loadUpcomingMatchesList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      drawer: SideMenu(),
      appBar: SkipperAppbar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: BlocConsumer<UpcomingMatchesCubit, UpcomingMatchesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return (state is UpcomingMatchesLoading)
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60.0,
                          width: double.maxFinite,
                          child: PageView.builder(
                            padEnds: false,
                            controller: _controller,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int itemIndex) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Image.asset(
                                  'assets/images/banner1.png',
                                ),
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 10.0,
                          ),
                          child: PageIndicator(
                            itemCount: 4,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 25.0,
                              left: 20.0,
                            ),
                            child: SkipperText.bodyBold(
                              "Upcoming Matches",
                              textAlign: TextAlign.left,
                              color: AppColors.white,
                            )),
                        RefreshIndicator(
                          color: AppColors.yellow,
                          onRefresh: () {
                            return Future.delayed(const Duration(seconds: 1),
                                () {
                              upcomingMatchesCubit.loadUpcomingMatchesList();
                            });
                          },
                          child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.upcomingMatchesList?.length,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SelectMatchScreen()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 20.0, right: 20.0),
                                    child: UpcomingMatchTile(
                                        state.upcomingMatchesList![index]),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
