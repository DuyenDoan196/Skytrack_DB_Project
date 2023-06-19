CREATE TABLE [dwh].[fact]
(
            fact_id int identity(1,1) primary key
	       ,Id_passengers   int  FOREIGN KEY REFERENCES dwh.dim_passengers (Id_passengers)
            ,ID_airline     int   FOREIGN KEY REFERENCES dwh.dim_airline(ID_airline)
            ,Id_airport     int   FOREIGN KEY REFERENCES dwh.dim_airport (Id_airport)
            ,Id_aircrafts   int   FOREIGN KEY REFERENCES dwh.dim_aircrafts (Id_aircrafts)
            ,Id_lounge      int   FOREIGN KEY REFERENCES dwh.dim_lounges (Id_lounge)
            ,[airport_visit_date] varchar(400)
            ,[lounge_visit_date] varchar(400)
            ,[flight_date] varchar(400)
            ,[airline_review_date] varchar(400)
            ,[airport_review_date] varchar(400)
            ,[lounge_review_date] varchar(400)
            ,[seat_review_date]varchar(400)
           ,[airline_overall_rating]    int
           ,[airline_seat_comfort_rating]   int
           ,[airline_cabin_staff_rating]    int
           ,[airline_food_beverages_rating] int
           ,[airline_inflight_entertainment_rating]     int     
           ,[airline_ground_service_rating]             int  
           ,[airline_wifi_connectivity_rating]          int
           ,[airline_value_money_rating]                int
           ,[airline_recommended]                       int
           ,[airport_overall_rating]                    int
           ,[airport_queuing_rating]                    int
           ,[airport_terminal_cleanness_rating]         int
           ,[airport_terminal_seating_rating]           int
           ,[airport_terminal_signs_rating]             int
           ,[airport_food_beverages_rating]         int
           ,[airport_shopping_rating]               int
           ,[airport_wifi_connectivity_rating]      int
           ,[airport_staff_rating]                  int
           ,[airport_recommended]                   int
           ,[lounge_overall_rating]                 int
           ,[lounge_comfort_rating]                 int
           ,[lounge_cleanness_rating]               int
           ,[lounge_washrooms_rating]               int
           ,[lounge_wifi_connectivity_rating]       int
           ,[lounge_staff_service_rating]           int
           ,[lounge_recommended]                    int
           ,[seat_overall_rating]                   int
           ,[seat_legroom_rating]       int
           ,[seat_recline_rating]       int
           ,[seat_width_rating]         int
           ,[seat_aisle_space_rating]   int
           ,[seat_viewing_tv_rating]    int
           ,[seat_power_supply_rating]  int
           ,[seat_storage_rating]       int
           ,[seat_recommended]          int
           ,[overall_rating]            FLOAT
           ,[overall_recommendation]    FLOAT
)
