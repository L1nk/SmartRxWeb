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

Medication.delete_all

Event.delete_all

Alert.delete_all

EventConflict.delete_all

MedicationConflict.delete_all

CaregiverToSchedule.delete_all

CaregiverPermissionLevel.delete_all
