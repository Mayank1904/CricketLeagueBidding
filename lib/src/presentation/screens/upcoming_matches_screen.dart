import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/router/app_router.dart';
import '../../resources/constants/colors.dart';
import '../components/skipper_text.dart';
import '../cubits/upcomingMatches/upcoming_matches_cubit.dart';
import 'widgets/page_indicator.dart';
import 'widgets/upcoming_match_tile.dart';

@RoutePage()
class UpcomingMatchesScreen extends StatefulWidget {
  const UpcomingMatchesScreen({super.key});

  @override
  State<UpcomingMatchesScreen> createState() => _UpcomingMatchesScreenState();
}

class _UpcomingMatchesScreenState extends State<UpcomingMatchesScreen> {
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
    return BlocConsumer<UpcomingMatchesCubit, UpcomingMatchesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (contxt, state) {
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
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.upcomingMatchesList?.length,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                contxt.router.push(SelectMatchRoute(
                                    card: state.upcomingMatchesList![index]));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 20.0, right: 20.0),
                                child: UpcomingMatchTile(
                                    state.upcomingMatchesList![index]),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              );
      },
    );
  }
}
