# Body mass index (BMI). ----
#' @references World Health Organization (WHO) BMI Classification.

calculate_bmi <- function(weight_kg, height_m) {
    # Validation: Ensure height isn't zero to avoid errors
    if(height_m <= 0) stop("Height must be greater than 0")
    
    bmi <- weight_kg / (height_m^2)
    return(round(bmi, 1))
}

# Target heart rate(THR). ----
calculate_thr <- function(age, rest_hr, intensity = 0.6) {
    max_hr <- 220 - age
    thr <- ((max_hr - rest_hr) * intensity) + rest_hr
    return(round(thr))
}

# Heart rate reserve(HRR). ----
calculate_hrr <- function(age, rest_hr){
    hrr <- (220 -age) - rest_hr
    return(round(hrr))
}

# Mean Arterial Pressure (MAP). ----
calculate_map <- function(systolic_bp, diastolic_bp){
    map <- (systolic_bp + (2 * diastolic_bp)) / 3
    return(round(map))
}

# Timed Up and Go (TUG). ----
#' @references Podsiadlo & Richardson (1991); Shumway-Cook et al. (2000).
# Use data.table package with this function.

calculate_TUG <- function(time_sec) {
    fcase(
        time_sec < 10, "Normal mobility",
        time_sec >= 10 & time_sec <= 20, "Fair mobility",
        time_sec > 20 & time_sec <= 30, "Impaired mobility",
        time_sec > 30, "High risk of fall",
        default = "Incomplete/Error"
    )
}

# Waist-to-Height Ratio (WtHR). ----
calculate_WtHR <- function(waist_cm, height_cm) {
    WtHR <- waist_cm / height_cm
    return(round(WtHR,2))
}

# Minute Ventilation (V_E). ----
calculate_VE <- function(tidal_vol_L, R_rate) {
    VE <- tidal_vol_L * R_rate
    return(round(VE, 1))
}