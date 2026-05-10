# 1. 10-Meter Walk Test (Gait Speed). ----
# Use data.table package with this function.
#' @references Perry et al. (1995); Fritz & Lusardi (2009).

calculate_gait_speed <- function(time_sec) {
    speed_mps <- 10 / time_sec
    fcase(
        speed_mps < 0.4, "Household ambulator",
        speed_mps >= 0.4 & speed_mps <= 0.8, "Limited community ambulator",
        speed_mps > 0.8, "community ambulator",
        default = "Incomplete/Error"
    )
} 

# Functional Reach Test. ----
# Use data.table package with this function. Specify the unit if it is in inches.
#' @references Duncan, P. W., et al. (1990). Functional reach: a new clinical 
#' measure of balance. Journal of Gerontology.

calculate_reach_distance <- function(distance, unit = "cm") {
    val_in <- if(unit == "cm") { distance / 2.54 } 
    else { distance }
    fcase(
        val_in > 10, "Low risk",
        val_in >= 6 & val_in <= 10, "Moderate risk",
        val_in < 6, "High risk",
        default = "Incomplete/Error"
    )
}

# 6-Minute Walk Test (6MWT) - Predicted Distance (Enright & Sherrill Formula).----
#' @references Enright, P. L., & Sherrill, D. L. (1998). Reference equations 

calculate_6min_walk_distance <- function(weight_kg, height_cm, age, gender) {
    ifelse(gender == "Male",
           pred <- (7.57 * height_cm) - (5.02 * age) - (1.76 * weight_kg) - 309,
           pred <- (2.11 * height_cm) - (2.29 * weight_kg) - (5.78 * age) + 667
    )
    return(round(pred))
}

# Lower Extremity Functional Scale (LEFS). ----
#' @references Binkley et al. (1999). The LEFS: scale development and validation.

calculate_LEFS <- function(score){
    pt_score <- (score / 80) * 100
    return(pt_score)
}

# Neck Disability Index (NDI). ----
# Use data.table package with this function.
#' @references Vernon, H., & Mior, S. (1991). The Neck Disability Index. 
#' J Manipulative Physiol Ther.

calculate_NDI <- function(NDI_score){
    fcase(
        NDI_score >= 0 & NDI_score <= 4, "No disability",
        NDI_score >= 5 & NDI_score <= 14, "Mild disability",
        NDI_score >= 15 & NDI_score <= 24, "Moderate disability",
        NDI_score >= 25 & NDI_score <= 34, "Severe disability",
        NDI_score > 34, "Complete disability",
        default = "Incomplete/Error"
    )
}

# Range of Motion (ROM) Deficit Percentage. ----
calculate_ROM_percentage <- function(involved, uninvolved){
  ROM <- 100 - ((involved  / uninvolved) * 100)
  return(round(ROM, 1))
}


# Berg Balance Scale (BBS). ----
# Use data.table package with this function.
#' @references Berg, K. O., et al. (1992). Measuring balance in the elderly. 

calculate_BBS <- function(BBS_score){
    fcase(
        BBS_score >= 41 & BBS_score <= 56, "Low fall risk",
        BBS_score >= 21 & BBS_score <= 40, "Medium fall risk",
        BBS_score >= 0 & BBS_score <= 20, "High fall risk",
        default = "Incomplete/Error"
    )
}

# Limb Symmetry Index (LSI).----
calculate_LSI <- function(involved, uninvolved) {
    LSI <- (involved / uninvolved) * 100
    return(round(LSI,1))
} 

# Estimated 1-Rep Max (1RM) - Brzycki Formula. ----
#' @references Brzycki, M. (1993). Strength testing—Predicting a one-rep max. 
#' JOPERD.

calculate_1RM <- function(weight_kg, n_reps) {
  C_1RM <- weight_kg / (1.0278 - (0.0278 * n_reps))
  return(round(C_1RM, 1))
}


