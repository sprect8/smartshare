### Datalytics configurable properties
All configurations must be valid JSON files (use jsonlint if you're not sure)
No spaces or tables (must be flat)
e.g.:
{
"table":{
"columns":{
"ranges": [
"interpolateOrRd",
"interpolateOrRd"
]
}
}
}

NOT

```
{
    "table":{
        "columns":{
            "ranges":["interpolateOrRd", "interpolateOrRd", null, "interpolateOrRd"], 
            "scores":{
                "3":{},
                "4":{
                    "underColor":"green",
                    "underFill":"green",
                    "overColor":"red",
                    "overFill":"red",
                    "flatColor":"orange",
                    "flatFill":"orange"
                }
            }
        }
    },
    "pageSize":10
}
```
Examples below are tabbed for easy reading!
# Tables
```
{
    "table":{
        "columns":{
            "ranges":["interpolateOrRd", "interpolateOrRd", null, "interpolateOrRd"], 
            "scores":{
                "3":{},
                "4":{
                    "underColor":"green",
                    "underFill":"green",
                    "overColor":"red",
                    "overFill":"red",
                    "flatColor":"orange",
                    "flatFill":"orange"
                }
            }
        }
    },
    "pageSize":10
}
```
Notes: 
- ranges map starting at index 1 (because we map using the series values)
- Put null in the ranges to skip specific columns
- scores map start at index 0
- scores is an object and the key (number) represents the index of the column
- refer to https://github.com/d3/d3-scale-chromatic for valid ranges configuration

# Maps
```
{
    "mapCentre":{
        "lat":3.10,
        "long":,107.42
    },
    "mapZoom":6
}
```
