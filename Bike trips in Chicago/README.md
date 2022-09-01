## Introduction
In this project, we carry out exploratory analysis of the Divvy data set by setting out research questions, and then exploring relationship between stations, user behaviors and bike types to answer those questions.

*The project was completed as a part of Google's Data Analytics Professional Certificate online course on Coursera.*

## 🚴‍♀️ About the Data
This dataset is provided by [Divvy bikes](https://divvybikes.com) according to the [Divvy Data License Agreement](https://ride.divvybikes.com/data-license-agreement).

Each trip is anonymized and includes:
- Trip start day and time
- Trip end day and time
- Trip start station
- Trip end station
- Rider type (Member, Single Ride, and Day Pass)

The data has been processed to remove trips that are taken by staff as they service and inspect the system; and any trips that were below 60 seconds in length (potentially false starts or users trying to re-dock a bike to ensure it was secure).

> To know more about Divvy and the dataset, visit this [link](https://ride.divvybikes.com/system-data).

### 🔗 Data sources
- [Divvy bikes](https://divvybikes.com), download the raw data-sets [here](https://divvy-tripdata.s3.amazonaws.com/index.html)
- [Chicago Data Portal](https://data.cityofchicago.org/), download the raw stations-table:
  - Download the updated version [here](https://data.cityofchicago.org/Transportation/Divvy-Bicycle-Stations/bbyy-e7gq).
  - Download the version I used [here](https://github.com/ca-ros/divvy-bikeshare/blob/master/data%20wrangling/csv%20files/stations_raw/Divvy_Bicycle_Stations.csv). June 28, 2022

> The Stations table continues to get updates. I noticed some changes since I downloaded the data on May 15, 2022 and redownload on June 28, 2022. When I check the site, there is an update on May 18, 2022 hence the change in data.

## About the Company
Divvy is Chicagoland’s bike share system across Chicago and Evanston. Divvy provides residents and visitors with a convenient, fun and affordable transportation option for getting around and exploring Chicago.

Divvy, like other bike share systems, consists of a fleet of specially-designed, sturdy and durable bikes that are locked into a network of docking stations throughout the region. The bikes can be unlocked from one station and returned to any other station in the system. People use bike share to explore Chicago, commute to work or school, run errands, get to appointments or social engagements, and more.

Divvy is available for use 24 hours/day, 7 days/week, 365 days/year, and riders have access to all bikes and stations across the system.

## About the Owner
Divvy is a program of the [Chicago Department of Transportation](https://www.chicago.gov/city/en/depts/cdot.html) (CDOT), which owns the city’s bikes, stations and vehicles. Initial funding for the program came from federal grants for projects that promote economic recovery, reduce traffic congestion and improve air quality, as well as additional funds from the City’s Tax Increment Financing program. In 2016, Divvy expanded to the neighboring suburb of [Evanston](https://ride.divvybikes.com/explore-chicago/expansion/evanston) with a grant from the State of Illinois.

CDOT’s mission is to keep the city’s surface transportation networks and public ways safe for users, environmentally sustainable and in a state of good repair and attractive, so that its diverse residents, businesses and guests can all enjoy a variety of quality transportation options, regardless of ability or destination.

CDOT’s vision is to ensure that Chicago continues to be a vibrant international city, successfully competing in the global economy with a transportation system that provides high-quality service to residents, businesses, and visitors – a system that offers a solid foundation for the city, regional and national economies, yet is sensitive to its communities and environment.

## About Lyft
Lyft was founded in 2012 by Logan Green and John Zimmer to improve people’s lives with the world’s best transportation. Lyft is committed to effecting positive change for our cities and making cities more livable for everyone by promoting transportation equity through bikeshare systems and public transit partnerships.

Lyft currently manages all of the largest bike share systems in the United States and many of the largest systems in the world, including Bay Wheels (California Bay Area), Bluebikes (Boston, MA), Citi Bike (New York and Jersey City), Divvy (Chicago, IL), CoGo Bike Share (Columbus, OH), Capital Bikeshare (Washington, D.C.), Nice Ride (Minneapolis, MN), and BIKETOWN (Portland, OR).

## Goal
Design marketing strategies aimed at converting casual riders into annual members.

## Research Questions
Three questions will guide the future marketing program:

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?


## Documentation

- [Data wrangling](https://github.com/ca-ros/divvy-bikeshare/blob/master/docs/data_wrangling.md)
- Data analysis with Python (**Coming soon** 🚧)
- Machine learning with Python: Filling missing values (station names) using coordinates (**Coming soon** 🚧)

## Dashboard
- [Biketrips in Chicago](https://public.tableau.com/app/profile/chris.arthur.rosaroso/viz/BiketripsinChicago/viz)

Preview:

![](https://github.com/ca-ros/divvy-bikeshare/blob/master/resources/img/data-viz-v2.png)


## 🧹 Cleaned Dataset
Download here:
- [Kaggle](www.kaggle.com/dataset/e116a4d4f9c1900cf2b5b0b6a9270e20a378a4a18d209f5277253e8afbf2ef7d)
- [Google Drive](https://drive.google.com/file/d/1xhHuh9WXHtIBLPV6OO-a62th6Ev27jmM/view?usp=sharing)

> This dataset contains stations with null values. I kept it incased someone need the entire data. These will be filled with data in the future after I have a good grasp in **Machine Learning** and **Web Scraping**.  