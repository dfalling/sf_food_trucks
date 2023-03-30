# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FoodTrucks.Repo.insert!(%FoodTrucks.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# first line from CSV:
# locationid,Applicant,FacilityType,cnn,LocationDescription,Address,blocklot,block,lot,permit,Status,FoodItems,X,Y,Latitude,Longitude,Schedule,dayshours,NOISent,Approved,Received,PriorPermit,ExpirationDate,Location,Fire Prevention Districts,Police Districts,Supervisor Districts,Zip Codes,Neighborhoods (old)
# 735318,Ziaurehman Amini,Push Cart,30727000,MARKET ST: DRUMM ST intersection,5 THE EMBARCADERO,0234017,0234,017,15MFF-0159,REQUESTED,,6013916.72,2117244.027,37.794331003246846,-122.39581105302317,http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=15MFF-0159&ExportPDF=1&Filename=15MFF-0159_schedule.pdf,,,,20151231,0,03/15/2016 12:00:00 AM,"(37.794331003246846, -122.39581105302317)",4,1,10,28855,6

push_cart =
  FoodTrucks.Food.change_facility(%FoodTrucks.Food.Facility{}, %{
    location_id: 735_318,
    applicant: "Ziaurehman Amini",
    facility_type: "Push Cart",
    cnn: 30_727_000,
    location_description: "MARKET ST: DRUMM ST intersection",
    address: "5 THE EMBARCADERO",
    blocklot: "0234017",
    block: "0234",
    lot: "017",
    permit: "15MFF-0159",
    status: "REQUESTED",
    food_items: "",
    x: 6_013_916.72,
    y: 2_117_244.027,
    latitude: 37.794331003246846,
    longitude: -122.39581105302317,
    schedule:
      "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=15MFF-0159&ExportPDF=1&Filename=15MFF-0159_schedule.pdf",
    days_hours: "",
    noi_sent: "",
    approved: "",
    received: "20151231",
    prior_permit: false,
    expiration_date: "2015-01-23 23:50:07",
    location: "0",
    fire_prevention_districts: "03",
    police_districts: "15",
    supervisor_districts: "10",
    zip_codes: "28855",
    neighborhoods: "6"
  })

FoodTrucks.Repo.insert!(push_cart)
