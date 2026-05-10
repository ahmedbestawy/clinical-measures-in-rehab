# we use data.table package in our analysis.
library(data.table)

# 1. Load the dataset
dt <- fread("physio_data.csv")

# 2. Using the functional `:=` syntax to process all 16 measures in one step
dt[, `:=`(
    # --- Cardiopulmonary Measures ---
    BMI      = calculate_bmi(weight_kg, height_cm / 100),
    THR      = calculate_thr(age, rest_hr, ex_intensity),
    HRR      = calculate_hrr(age, rest_hr),
    MAP      = calculate_map(systolic_bp, diastolic_bp),
    VE       = calculate_VE(tidal_vol_L, resp_rate),
    WtHR     = calculate_WtHR(waist_cm, height_cm),
    Pred_6MW = calculate_6min_walk_distance(weight_kg, height_cm, age, gender),
    
    # --- Neurology Measures ---
    TUG_Cat  = calculate_TUG(tug_sec),
    Gait_Cat = calculate_gait_speed(gait_10m_sec),
    BBS_Risk = calculate_BBS(bbs_score),
    FRT_Risk = calculate_reach_distance(reach_cm),
    
    # --- MSK Measures ---
    LEFS_Pct = calculate_LEFS(lefs_score),
    NDI_Cat  = calculate_NDI(ndi_score),
    ROM_Def  = calculate_ROM_percentage(rom_inv, rom_uninv),
    LSI_Pct  = calculate_LSI(strength_inv, strength_uninv),
    Est_1RM  = calculate_1RM(lift_kg, reps_1rm)
)]

# 3. Testing a sample.
dt2 <- print(dt[, .(patient_id, TUG_Cat, Gait_Cat, FRT_Risk, BBS_Risk)])

# 4. Output
fwrite(dt2, "Analyzed_Data.csv")