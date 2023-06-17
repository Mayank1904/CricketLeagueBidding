import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/responses/card.dart';
import '../../resources/constants/colors.dart';
import '../components/skipper_app_bar.dart';
import '../components/skipper_scaffold.dart';
import '../cubits/selectContest/select_contest_cubit.dart';
import 'create_team_screen.dart';
import 'widgets/chip.dart';
import 'widgets/contest_tile.dart';

@RoutePage()
class SelectMatchScreen extends StatefulWidget {
  final Cards? card;
  const SelectMatchScreen({super.key, this.card});

  @override
  State<SelectMatchScreen> createState() => _SelectMatchScreenState();
}

class _SelectMatchScreenState extends State<SelectMatchScreen> {
  late SelectContestCubit selectContestCubit;

  @override
  void initState() {
    super.initState();
    selectContestCubit = BlocProvider.of<SelectContestCubit>(context);
    selectContestCubit.loadContestList();
  }

  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      appBar: SkipperAppbar(
        title: widget.card?.shortName,
        subTitle: '1h 51m left',
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
      body: BlocConsumer<SelectContestCubit, SelectContestState>(
        listener: (context, state) {},
        builder: (context, state) {
          return (state is SelectContestLoading)
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: <Widget>[
                          chip('Contests', true),
                          chip('My Contests (0)', false),
                          chip('My Team (0)', false),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Mega Contest",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Graphik",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left,
                            ),
                            RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffb5b5b5),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Graphik",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  text: "Sort By: "),
                              TextSpan(
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Graphik",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  text: "Entry")
                            ]))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.contestList?.length,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreateTeamScreen(
                                                  team1:
                                                      widget.card?.teams.a.name,
                                                  team2:
                                                      widget.card?.teams.b.name,
                                                )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child:
                                        ContestTile(state.contestList![index]),
                                  ),
                                );
                              },
                            ),
                            Container(
                              width: 240.0,
                              padding: const EdgeInsets.all(9.0),
                              margin: const EdgeInsets.only(bottom: 30.0),
                              decoration: const BoxDecoration(
                                color: AppColors.darkYellow,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueGrey, //New
                                      blurRadius: 50.0,
                                      offset: Offset(0.0, 1.0),
                                      blurStyle: BlurStyle.outer)
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // Contests
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/contest_icon.png',
                                        width: 15.0,
                                        height: 15.0,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          "Contests",
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Graphik",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    color: AppColors.black,
                                    height: 16,
                                    width: 1,
                                  ), // Create team
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/plus_black.png',
                                        width: 15.0,
                                        height: 15.0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CreateTeamScreen()));
                                          },
                                          child: const Text(
                                            "Create team",
                                            style: TextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Graphik",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.0,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
