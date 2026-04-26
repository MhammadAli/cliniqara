enum ImmunizationStatus { due, missed, completed }

class VaccineRecommendation {
  final String vaccine;
  final ImmunizationStatus status;

  const VaccineRecommendation({
    required this.vaccine,
    required this.status,
  });
}

class VaccineDose {
  final String name;
  final int scheduleMonths;

  const VaccineDose(this.name, this.scheduleMonths);
}

const List<VaccineDose> _egyptianSchedule = [
  VaccineDose('BCG', 0),
  VaccineDose('OPV (Zero dose)', 0),
  VaccineDose('Hepatitis B (1st dose)', 0),
  VaccineDose('Pentavalent (DTP + HepB + Hib) – 1st dose', 2),
  VaccineDose('OPV – 1st dose', 2),
  VaccineDose('IPV – 1st dose', 2),
  VaccineDose('Pentavalent – 2nd dose', 4),
  VaccineDose('OPV – 2nd dose', 4),
  VaccineDose('IPV – 2nd dose', 4),
  VaccineDose('Pentavalent – 3rd dose', 6),
  VaccineDose('OPV – 3rd dose', 6),
  VaccineDose('Measles (1st dose)', 9),
  VaccineDose('MMR (Measles, Mumps, Rubella)', 12),
  VaccineDose('Booster DTP', 18),
  VaccineDose('OPV booster', 18),
  VaccineDose('MMR (2nd dose)', 18),
  VaccineDose('DTP booster (School Entry)', 48),
  VaccineDose('OPV booster (School Entry)', 48),
];

class ImmunizationCalculator {
  List<VaccineRecommendation> call({
    required int years,
    required int months,
    required int days,
    List<String> completedVaccines = const [],
  }) {
    final int ageInMonths = years * 12 + months;
    final List<VaccineRecommendation> recommendations = [];

    for (final dose in _egyptianSchedule) {
      if (completedVaccines.contains(dose.name)) {
        recommendations.add(
          VaccineRecommendation(
            vaccine: dose.name,
            status: ImmunizationStatus.completed,
          ),
        );
      } else if (ageInMonths > dose.scheduleMonths) {
        recommendations.add(
          VaccineRecommendation(
            vaccine: dose.name,
            status: ImmunizationStatus.missed,
          ),
        );
      } else if (ageInMonths == dose.scheduleMonths) {
        recommendations.add(
          VaccineRecommendation(
            vaccine: dose.name,
            status: ImmunizationStatus.due,
          ),
        );
      }
    }

    return recommendations;
  }
}
