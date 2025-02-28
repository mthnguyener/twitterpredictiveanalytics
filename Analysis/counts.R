deaths <- read.csv("C:/Users/mthng/OneDrive/Documents/Personal/School/3 Spring 2020/Predictive Analytics (ITEC 621-002)/Project/JHU/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv")

deaths.total <- aggregate(. ~ Country.Region, deaths, sum) %>%
  mutate(Country.Region = as.character(Country.Region)) %>%
  select(-Province.State, -Lat, -Long)

deaths.total$Country.Region = replace(x = deaths.total$Country.Region, 
                                  list =  !deaths.total$Country.Region %in% c('China', 'US', 'Italy'), values =  'Others')

deaths.total %>%
  group_by(Country.Region) %>%
  summarize_all(sum) -> deaths.total

deaths.total %>%
  bind_rows(summarize_all(., funs(if(is.numeric(.)) sum(.) else "Total"))) ->
  deaths.total

deaths.total %>%
  pivot_longer(cols = )

confirmed <- read.csv("C:/Users/mthng/OneDrive/Documents/Personal/School/3 Spring 2020/Predictive Analytics (ITEC 621-002)/Project/JHU/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv")

confirmed.total <- aggregate(. ~ Country.Region, confirmed, sum) %>%
  mutate(Country.Region = as.character(Country.Region)) %>%
  select(-Province.State, -Lat, -Long)

confirmed.total$Country.Region = replace(x = confirmed.total$Country.Region, 
                                      list =  !confirmed.total$Country.Region %in% c('China', 'US', 'Italy'), values =  'Others')

confirmed.total %>%
  group_by(Country.Region) %>%
  summarize_all(sum) -> confirmed.total

confirmed.total %>%
  bind_rows(summarize_all(., funs(if(is.numeric(.)) sum(.) else "Total"))) ->
  confirmed.total

recovered <- read.csv("C:/Users/mthng/OneDrive/Documents/Personal/School/3 Spring 2020/Predictive Analytics (ITEC 621-002)/Project/JHU/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv")

recovered.total <- aggregate(. ~ Country.Region, recovered, sum) %>%
  mutate(Country.Region = as.character(Country.Region)) %>%
  select(-Province.State, -Lat, -Long)

recovered.total$Country.Region = replace(x = recovered.total$Country.Region, 
                                         list =  !recovered.total$Country.Region %in% c('China', 'US', 'Italy'), values =  'Others')

recovered.total %>%
  group_by(Country.Region) %>%
  summarize_all(sum) -> recovered.total

recovered.total %>%
  bind_rows(summarize_all(., funs(if(is.numeric(.)) sum(.) else "Total"))) ->
  recovered.total
