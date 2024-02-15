import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsquee/Apply_Job/job_cubit/state.dart';
import 'package:jobsquee/Apply_Job/widget/type_workTitle.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial());

  static JobCubit get(context) => BlocProvider.of(context);
  int activeIndex = 0;

  void changeIndex(index) {
    activeIndex = index;
    emit(ChangeIndexState());
  }

  int currentStep = 0;

  void addStep() {
    currentStep = currentStep + 1;
    print(currentStep);
    emit(ChangeAddStepState());
  }

  void minusStep() {
    currentStep = currentStep - 1;


    print(currentStep);
    emit(ChangeMinusStepState());
  }

  int? selectedChoice;

  // bool isSelected=false ;

  void selectChoice(value) {
    selectedChoice = value;
    // isSelected=true;
    emit(ChangeSelectedChoiceState());
  }

  final List<TypeofWorkTile> typeOfWorkTiles = [
    TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 1,),
    TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 2),
    TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 3,),
    TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 4,),
  ];


}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
