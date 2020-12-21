JSON=$(curl https://weather.tsukumijima.net/api/forecast/city/100010)

TODAY_MAX_TEMPERATURE=$(echo $JSON | jq -r '.forecasts[0].temperature.max.celsius')
TODAY_MIN_TEMPERATURE=$(echo $JSON | jq -r '.forecasts[0].temperature.min.celsius')
TODAY_FORECAST=$(echo $JSON | jq -r '.forecasts[0].image.title')

TOMORROW_MAX_TEMPERATURE=$(echo $JSON | jq -r '.forecasts[1].temperature.max.celsius')
TOMORROW_MIN_TEMPERATURE=$(echo $JSON | jq -r '.forecasts[1].temperature.min.celsius')
TOMORROW_FORECAST=$(echo $JSON | jq -r '.forecasts[1].image.title')

echo "today: $TODAY_FORECAST $TODAY_MAX_TEMPERATURE℃/$TODAY_MIN_TEMPERATURE℃, tomorrow: $TOMORROW_FORECAST"
