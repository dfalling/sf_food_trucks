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
# 1612654,Sunset Mercantile/Outer Sunset Farmers Market & Mercantile,Truck,1835000,37TH AVE: QUINTARA ST to RIVERA ST (2100 - 2199),2155 37TH AVE,2094006,2094,006,22MFF-00031,REQUESTED,Multiple Food Trucks & Food Types,5984527.62,2100736.237,37.74732654654123,-122.49628067270531,http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=22MFF-00031&ExportPDF=1&Filename=22MFF-00031_schedule.pdf,,,,20220421,0,11/15/2022 12:00:00 AM,"(37.74732654654123, -122.49628067270531)",1,8,3,29491,35
# 1658690,Bonito Poke,Truck,3528000,CALIFORNIA ST: SANSOME ST to LEIDESDORFF ST (400 - 448),430 CALIFORNIA ST,0239029,0239,029,22MFF-00070,APPROVED,Bonito Poke Bowls & Various Drinks,6012181.836,2116889.979,37.793262206923096,-122.4017890913628,http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=22MFF-00070&ExportPDF=1&Filename=22MFF-00070_schedule.pdf,,,11/09/2022 12:00:00 AM,20221109,0,11/15/2023 12:00:00 AM,"(37.793262206923096, -122.4017890913628)",4,1,10,28854,6

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

truck =
  FoodTrucks.Food.change_facility(%FoodTrucks.Food.Facility{}, %{
    location_id: 1_612_654,
    applicant: "Sunset Mercantile/Outer Sunset Farmers Market & Mercantile",
    facility_type: "Truck",
    cnn: 1_835_000,
    location_description: "37TH AVE: QUINTARA ST to RIVERA ST (2100 - 2199)",
    address: "2155 37TH AVE",
    blocklot: "2094006",
    block: "2094",
    lot: "006",
    permit: "22MFF-00031",
    status: "REQUESTED",
    food_items: "Multiple Food Trucks & Food Types",
    x: 5_984_527.62,
    y: 2_100_736.237,
    latitude: 37.74732654654123,
    longitude: -122.49628067270531,
    schedule:
      "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=22MFF-00031&ExportPDF=1&Filename=22MFF-00031_schedule.pdf",
    days_hours: "",
    noi_sent: "",
    approved: "",
    received: "20220421",
    prior_permit: false,
    expiration_date: "2022-11-15 23:50:07",
    location: "0",
    fire_prevention_districts: "01",
    police_districts: "08",
    supervisor_districts: "03",
    zip_codes: "29491",
    neighborhoods: "35"
  })

truck_2 =
  FoodTrucks.Food.change_facility(%FoodTrucks.Food.Facility{}, %{
    location_id: 1_658_690,
    applicant: "Bonito Poke",
    facility_type: "Truck",
    cnn: 3_528_000,
    location_description: "CALIFORNIA ST: SANSOME ST to LEIDESDORFF ST (400 - 448)",
    address: "430 CALIFORNIA ST",
    blocklot: "0239029",
    block: "0239",
    lot: "029",
    permit: "22MFF-00070",
    status: "APPROVED",
    food_items: "Bonito Poke Bowls & Various Drinks",
    x: 6_012_181.836,
    y: 2_116_889.979,
    latitude: 37.793262206923096,
    longitude: -122.4017890913628,
    schedule:
      "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=22MFF-00070&ExportPDF=1&Filename=22MFF-00070_schedule.pdf",
    days_hours: "",
    prior_permit: false,
    expiration_date: "2023-11-15 23:50:07",
    location: "0",
    fire_prevention_districts: "04",
    police_districts: "01",
    supervisor_districts: "10",
    zip_codes: "28854",
    neighborhoods: "6"
  })

FoodTrucks.Repo.insert!(push_cart)
FoodTrucks.Repo.insert!(truck)
FoodTrucks.Repo.insert!(truck_2)
