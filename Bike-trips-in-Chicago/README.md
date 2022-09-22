## Introduction
In this project, we carry out exploratory analysis of the Divvy data set by setting out research questions, and then exploring relationship between stations, user behaviors and bike types to answer those questions.

*The project was completed as a part of Google's Data Analytics Professional Certificate online course on Coursera and to showcase and develop my skills as a Data Analyst.*

## 🚴‍♀️ About the Data

This data set contains 9 years worth of divvy-bikes trip data from 2013-2021 with a total of 33 million records. The data is provided by [Divvy bikes](https://divvybikes.com) and wrangled by [Chris](https://www.linkedin.com/in/arthur0418/), that's me.

Each trip is anonymized and includes:
- Trip start day and time
- Trip end day and time
- Trip start station
- Trip end station
- Rider type (Member, Single Ride, and Day Pass)

The data has been processed to remove trips that are taken by staff as they service and inspect the system; and any trips that were below 60 seconds in length (potentially false starts or users trying to re-dock a bike to ensure it was secure).

> To know more about the system-data, visit this [link](https://ride.divvybikes.com/system-data).

### 🔗 Data sources
- [Divvy bikes](https://divvybikes.com), download the raw data-sets [here](https://divvy-tripdata.s3.amazonaws.com/index.html)
- [Chicago Data Portal](https://data.cityofchicago.org/), download the raw stations-table
  - Updated version, [September 2022](https://data.cityofchicago.org/Transportation/Divvy-Bicycle-Stations/bbyy-e7gq)
  - Version used in this project, [May 2022](https://github.com/ca-ros/DataSciencePortfolio/blob/master/Bike-trips-in-Chicago/resources/csv-files/stations_raw/Divvy_Bicycle_Stations.csv)

## About the Company
Divvy is Chicagoland’s bike share system across Chicago and Evanston. Divvy provides residents and visitors with a convenient, fun and affordable transportation option for getting around and exploring Chicago.

Divvy, like other bike share systems, consists of a fleet of specially-designed, sturdy and durable bikes that are locked into a network of docking stations throughout the region. The bikes can be unlocked from one station and returned to any other station in the system. People use bike share to explore Chicago, commute to work or school, run errands, get to appointments or social engagements, and more.

> To know more about the company, visit this [link](https://ride.divvybikes.com/about).

## Business Objective
Design marketing strategies aimed at converting casual riders into annual members.

## Research Questions
Three questions will guide the future marketing program:

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?


## Documentation

- [Data wrangling](https://github.com/ca-ros/DataSciencePortfolio/blob/master/Bike-trips-in-Chicago/docs/data_wrangling.md)
- Data analysis with Python (**Coming soon** 🚧)
- Machine learning with Python (**Coming soon** 🚧)
  - Filling missing values (station names) using coordinates 

## Dashboard
- [Biketrips in Chicago](https://public.tableau.com/app/profile/chris.arthur.rosaroso/viz/BiketripsinChicago/viz)

Preview:

![](https://github.com/ca-ros/DataSciencePortfolio/blob/master/Bike-trips-in-Chicago/resources/img/data-viz-v2.png)


## 🧹 Cleaned Dataset
Download here:
- [Kaggle](www.kaggle.com/dataset/e116a4d4f9c1900cf2b5b0b6a9270e20a378a4a18d209f5277253e8afbf2ef7d)
- [Google Drive](https://drive.google.com/file/d/1xhHuh9WXHtIBLPV6OO-a62th6Ev27jmM/view?usp=sharing)

> This dataset contains stations with null values. I kept it incased someone need the entire data. These will be filled with data in the future after I have a good grasp in **Machine Learning** and **Web Scraping**.  

## License

- [Divvy Data License Agreement](https://ride.divvybikes.com/data-license-agreement)