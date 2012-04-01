# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

Schedule.delete_all

Entry.delete_all

ScheduleDrug.delete_all

Event.delete_all

Alert.delete_all

EventConflict.delete_all

MedicationConflict.delete_all

CaregiverToSchedule.delete_all

CaregiverPermissionLevel.delete_all

CaregiverRequest.delete_all

Drug.delete_all

ScheduleDrugsConflict.delete_all

DrugTimeConflict.delete_all

#1
drug1 = Drug.create(name: 'Advil',
            directions: '',
            with_meal: true,
            importance: 1)

drug2 = Drug.create(name: 'Tylenol',
            directions: '',
            with_meal: true,
            importance: 1)

drug3 = Drug.create(name: 'Aspirin',
            directions: '',
            with_meal: true,
            importance: 2)

drug4 = Drug.create(name: 'Abilify',
            directions: 'take once a day',
            with_meal: false,
            importance: 4)

#5
drug5 = Drug.create(name: 'Benadryl',
            directions: "Don't exceed 300mg daily. Dose taken every 4-6 hours",
            with_meal: false,
            importance: 3)

drug6 = Drug.create(name: 'Zantac',
            directions: "Don't take with iron salts, itraconazole, and ketoconazole",
            with_meal: false,
            importance: 5)

drug7 = Drug.create(name: 'Itraconazole',
            directions: "Usually 200-400mg daily as a single dose or two divided doses. Must be takent with a full meal.",
            with_meal: true,
            importance: 4)

drug8 = Drug.create(name: 'Ketoconazole',
            directions: "Usually 200-400mg daily.",
            with_meal: false,
            importance: 4)

drug9 = Drug.create(name: 'Lamprene',
            directions: "Take once a day. It may be necessary to take this medication for up to 2 to 3 years.",
            with_meal: true,
            importance: 4)

#10
drug10 = Drug.create(name: 'Warfarin',
            directions: "",
            with_meal: false,
            importance: 5)

#Drug conflicts
MedicationConflict.create(medication1_id: drug1.id,
                          medication2_id: drug10.id,
			  conflict_type: 1)

MedicationConflict.create(medication1_id: drug2.id,
                          medication2_id: drug10.id,
			  conflict_type: 1)

MedicationConflict.create(medication1_id: drug3.id,
                          medication2_id: drug10.id,
			  conflict_type: 1)

MedicationConflict.create(medication1_id: drug6.id,
                          medication2_id: drug7.id,
			  conflict_type: 1)

MedicationConflict.create(medication1_id: drug6.id,
                          medication2_id: drug8.id,
			  conflict_type: 1)

#Drug time conflicts
DrugTimeConflict.create(drug1_id: drug1.id,
                        drug2_id: drug10.id,
                        conflict_time: 3600)

DrugTimeConflict.create(drug1_id: drug2.id,
                        drug2_id: drug10.id,
                        conflict_time: 7200)

DrugTimeConflict.create(drug1_id: drug3.id,
                        drug2_id: drug10.id,
                        conflict_time: 10800)

DrugTimeConflict.create(drug1_id: drug6.id,
                        drug2_id: drug7.id,
                        conflict_time: 1800)

DrugTimeConflict.create(drug1_id: drug6.id,
                        drug2_id: drug8.id,
                        conflict_time: 5000)
