rxQuantile("CRSDepTime", flight_mrs, probs = seq(0, 1, by = .1))
# "CRSDepTime" => variable name
# filght_mrs => XDF but could be data frame too
# probs => vector of propabilities in 0 to 1 range
